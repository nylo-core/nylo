import 'dart:convert';
import 'dart:io';

import 'package:nylo_framework/metro/ny_cli.dart';

void main(List<String> arguments) => _DownloadFontsCommand(arguments).run();

/// Download Fonts Command
///
/// Downloads Google Fonts for snapshot testing
///
/// Usage:
///   [From Terminal] metro app:download_fonts
///   [With Options]  metro app:download_fonts --font=Outfit
class _DownloadFontsCommand extends NyCustomCommand {
  _DownloadFontsCommand(super.arguments);

  @override
  CommandBuilder builder(CommandBuilder command) {
    command.addFlag("help", abbr: "h", help: "Show help information");
    command.addOption("font",
        abbr: "f",
        help: "Font family name to download (e.g., Outfit, Roboto)");
    command.addOption('assetDirectory',
      abbr: 'd',
      help: 'Asset directory to save fonts',
      defaultValue: 'assets/fonts',
    );

    return command;
  }

  @override
  Future<void> handle(CommandResult result) async {
    String? fontName = result.getString('font');
    String assetDirectory = result.getString('assetDirectory')!;

    // If no font specified, try to detect from design.dart
    fontName ??= await _detectFontFromDesign();

    if (fontName == null) {
      // Ask user for font name
      fontName = prompt('Enter the Google Font family name (e.g., Outfit):');
      if (fontName.isEmpty) {
        error('Font name is required');
        return;
      }
    }

    info('📦 Downloading Google Font: $fontName');

    // Create fonts directory if it doesn't exist
    final Directory fontsDir = Directory(assetDirectory);
    if (!fontsDir.existsSync()) {
      fontsDir.createSync(recursive: true);
    }

    // Download the font
    final bool success = await _downloadFont(fontName, fontsDir.path);

    if (success) {
      this.success('✅ Font downloaded to $assetDirectory/');

      // Add fonts to pubspec.yaml
      final bool addedToPubspec = await _addFontsToPubspec(fontName, assetDirectory);
      if (addedToPubspec) {
        this.success('✅ Added font family to pubspec.yaml');
      }

      // Update design.dart with the new font
      final bool updatedDesign = await _updateDesignFont(fontName);
      if (updatedDesign) {
        this.success('✅ Updated appFont in lib/config/design.dart');
      }

      info('');
    } else {
      error('❌ Failed to download font');
    }
  }

  /// Detect font family from lib/config/design.dart
  Future<String?> _detectFontFromDesign() async {
    final File designFile = File('lib/config/design.dart');
    if (!designFile.existsSync()) {
      return null;
    }

    final String content = await designFile.readAsString();

    // Look for GoogleFonts.fontName() pattern
    final RegExp regex = RegExp(r'GoogleFonts\.(\w+)\s*\(');
    final RegExpMatch? match = regex.firstMatch(content);

    if (match != null) {
      final String fontMethod = match.group(1)!;
      // Convert method name to proper font family name
      // e.g., "outfit" -> "Outfit", "robotoMono" -> "Roboto Mono"
      final String fontName = _methodToFontName(fontMethod);
      info('🔍 Detected font from design.dart: $fontName');
      return fontName;
    }

    return null;
  }

  /// Convert GoogleFonts method name to font family name
  String _methodToFontName(String methodName) {
    // Handle camelCase -> "Title Case With Spaces"
    final StringBuffer result = StringBuffer();
    for (int i = 0; i < methodName.length; i++) {
      final String char = methodName[i];
      if (i == 0) {
        result.write(char.toUpperCase());
      } else if (char.toUpperCase() == char && char != char.toLowerCase()) {
        result.write(' ');
        result.write(char);
      } else {
        result.write(char);
      }
    }
    return result.toString();
  }

  /// Update the appFont in lib/config/design.dart
  Future<bool> _updateDesignFont(String fontFamily) async {
    try {
      final File designFile = File('lib/config/design.dart');
      if (!designFile.existsSync()) {
        warning('lib/config/design.dart not found');
        return false;
      }

      String content = await designFile.readAsString();

      // Replace GoogleFonts.xxx() with TextStyle(fontFamily: 'FontName')
      final RegExp regex = RegExp(r'GoogleFonts\.\w+\(\)');
      if (!regex.hasMatch(content)) {
        warning('Could not find GoogleFonts usage in design.dart');
        return false;
      }

      content = content.replaceFirst(
          regex, "TextStyle(fontFamily: '$fontFamily')");

      // Remove google_fonts import if present
      content = content.replaceFirst(
          RegExp(r"import 'package:google_fonts/google_fonts\.dart';\n"), '');

      await designFile.writeAsString(content);
      return true;
    } catch (e) {
      error('Error updating design.dart: $e');
      return false;
    }
  }

  /// Add downloaded fonts to pubspec.yaml
  Future<bool> _addFontsToPubspec(
      String fontFamily, String assetDirectory) async {
    try {
      final File pubspecFile = File('pubspec.yaml');
      if (!pubspecFile.existsSync()) {
        warning('pubspec.yaml not found');
        return false;
      }

      final String content = await pubspecFile.readAsString();
      final String familyClean = fontFamily.replaceAll(' ', '');

      // Check if font family already exists in pubspec.yaml
      if (content.contains('family: $fontFamily') ||
          content.contains('family: $familyClean')) {
        info('Font family "$fontFamily" already exists in pubspec.yaml');
        return false;
      }

      // Find all downloaded font files for this family
      final Directory fontsDir = Directory(assetDirectory);
      final List<File> fontFiles = fontsDir
          .listSync()
          .whereType<File>()
          .where((File f) =>
              f.path.endsWith('.ttf') &&
              f.path
                  .split('/')
                  .last
                  .startsWith(familyClean))
          .toList()
        ..sort((File a, File b) => a.path.compareTo(b.path));

      if (fontFiles.isEmpty) {
        warning('No font files found for $fontFamily');
        return false;
      }

      // Build the font family YAML entry
      final StringBuffer buffer = StringBuffer();
      buffer.writeln('    - family: $fontFamily');
      buffer.writeln('      fonts:');

      for (final File file in fontFiles) {
        final String fileName = file.path.split('/').last;
        final String assetPath = '$assetDirectory/$fileName';
        final String lowerName = fileName.toLowerCase();

        buffer.write('        - asset: $assetPath');

        // Detect weight from filename
        final int? weight = _detectWeight(lowerName);
        if (weight != null && weight != 400) {
          buffer.write('\n          weight: $weight');
        }

        // Detect italic style
        if (lowerName.contains('italic')) {
          buffer.write('\n          style: italic');
        }

        buffer.writeln();
      }

      final String fontEntry = buffer.toString();

      // Find the root-level "flutter:" section (no indentation)
      final RegExp flutterSectionRegex = RegExp(r'\nflutter:\s*\n');
      final RegExpMatch? flutterMatch = flutterSectionRegex.firstMatch(content);

      if (flutterMatch == null) {
        error('Could not find root-level "flutter:" section in pubspec.yaml');
        return false;
      }

      final String afterFlutter = content.substring(flutterMatch.end);

      String updatedContent;
      if (afterFlutter.contains('\n  fonts:\n') ||
          afterFlutter.startsWith('  fonts:\n')) {
        // Append to existing fonts section within the flutter block
        final int fontsIndex =
            content.indexOf(RegExp(r'\n  fonts:\s*\n'), flutterMatch.start);
        final int insertPos = content.indexOf('\n', fontsIndex + 1) + 1;
        updatedContent =
            '${content.substring(0, insertPos)}$fontEntry${content.substring(insertPos)}';
      } else {
        // Add fonts section right after "flutter:\n"
        updatedContent =
            '${content.substring(0, flutterMatch.end)}  fonts:\n$fontEntry\n${content.substring(flutterMatch.end)}';
      }

      await pubspecFile.writeAsString(updatedContent);
      return true;
    } catch (e) {
      error('Error updating pubspec.yaml: $e');
      return false;
    }
  }

  /// Detect font weight from filename
  int? _detectWeight(String fileName) {
    if (fileName.contains('thin')) return 100;
    if (fileName.contains('extralight')) return 200;
    if (fileName.contains('light')) return 300;
    if (fileName.contains('regular')) return 400;
    if (fileName.contains('medium')) return 500;
    if (fileName.contains('semibold')) return 600;
    if (fileName.contains('extrabold')) return 800;
    if (fileName.contains('bold')) return 700;
    if (fileName.contains('black')) return 900;
    return null;
  }

  /// Download font from Google Fonts API
  Future<bool> _downloadFont(String fontFamily, String outputDir) async {
    try {
      // Google Fonts API URL
      final String apiKey = ''; // Public API key for Google Fonts
      final String encodedFamily = Uri.encodeComponent(fontFamily);
      final String apiUrl =
          'https://www.googleapis.com/webfonts/v1/webfonts?key=$apiKey&family=$encodedFamily';

      // Fetch font metadata
      final HttpClient httpClient = HttpClient();
      final HttpClientRequest request = await httpClient.getUrl(Uri.parse(apiUrl));
      final HttpClientResponse response = await request.close();

      if (response.statusCode != 200) {
        // Try alternative approach - direct download from fonts.google.com
        return await _downloadFontDirect(fontFamily, outputDir);
      }

      final String responseBody = await response.transform(utf8.decoder).join();
      final Map<String, dynamic> data = json.decode(responseBody) as Map<String, dynamic>;

      final List<dynamic>? items = data['items'] as List<dynamic>?;
      if (items == null || items.isEmpty) {
        warning('Font "$fontFamily" not found in Google Fonts API');
        return await _downloadFontDirect(fontFamily, outputDir);
      }

      final Map<String, dynamic> fontData = items[0] as Map<String, dynamic>;
      final Map<String, dynamic> files = fontData['files'] as Map<String, dynamic>;

      // Download each font weight
      int downloadCount = 0;
      for (final MapEntry<String, dynamic> entry in files.entries) {
        final String weight = entry.key;
        final String url = entry.value as String;

        // Convert weight name to filename
        final String weightName = _weightToName(weight);
        final String fileName = '${fontFamily.replaceAll(' ', '')}-$weightName.ttf';
        final String filePath = '$outputDir/$fileName';

        await withSpinner(
          message: 'Downloading $fileName',
          successMessage: 'Downloaded $fileName',
          task: () async {
            await _downloadFile(url, filePath);
          },
        );
        downloadCount++;
      }

      info('📥 Downloaded $downloadCount font files');
      return true;
    } catch (e) {
      error('Error downloading font: $e');
      return false;
    }
  }

  /// Alternative download method using direct URLs
  Future<bool> _downloadFontDirect(String fontFamily, String outputDir) async {
    info('Trying direct download method...');

    // Common font weights to download
    final Map<String, String> weights = <String, String>{
      '100': 'Thin',
      '200': 'ExtraLight',
      '300': 'Light',
      '400': 'Regular',
      '500': 'Medium',
      '600': 'SemiBold',
      '700': 'Bold',
      '800': 'ExtraBold',
      '900': 'Black',
    };

    int downloadCount = 0;

    for (final MapEntry<String, String> entry in weights.entries) {
      final String weightName = entry.value;
      final String fileName =
          '${fontFamily.replaceAll(' ', '')}-$weightName.ttf';
      final String filePath = '$outputDir/$fileName';

      // Try to download from Google Fonts static URL
      final String url =
          'https://fonts.gstatic.com/s/${fontFamily.toLowerCase().replaceAll(' ', '')}/'
          'v1/${fontFamily.replaceAll(' ', '')}-$weightName.ttf';

      try {
        final bool downloaded = await _tryDownloadFile(url, filePath);
        if (downloaded) {
          success('Downloaded $fileName');
          downloadCount++;
        }
      } catch (e) {
        // Weight not available, skip
      }
    }

    if (downloadCount == 0) {
      // Try one more approach - download from GitHub fonts repository
      warning(
          'Could not download font automatically. Please download manually:');
      info('1. Go to: https://fonts.google.com/specimen/${fontFamily.replaceAll(' ', '+')}');
      info('2. Click "Download family"');
      info('3. Extract and copy .ttf files to assets/fonts/');
      return false;
    }

    return true;
  }

  /// Convert weight number to name
  String _weightToName(String weight) {
    switch (weight) {
      case '100':
        return 'Thin';
      case '200':
        return 'ExtraLight';
      case '300':
        return 'Light';
      case 'regular':
      case '400':
        return 'Regular';
      case '500':
        return 'Medium';
      case '600':
        return 'SemiBold';
      case '700':
        return 'Bold';
      case '800':
        return 'ExtraBold';
      case '900':
        return 'Black';
      case '100italic':
        return 'ThinItalic';
      case '200italic':
        return 'ExtraLightItalic';
      case '300italic':
        return 'LightItalic';
      case 'italic':
      case '400italic':
        return 'Italic';
      case '500italic':
        return 'MediumItalic';
      case '600italic':
        return 'SemiBoldItalic';
      case '700italic':
        return 'BoldItalic';
      case '800italic':
        return 'ExtraBoldItalic';
      case '900italic':
        return 'BlackItalic';
      default:
        return weight.substring(0, 1).toUpperCase() + weight.substring(1);
    }
  }

  /// Download a file from URL
  Future<void> _downloadFile(String url, String filePath) async {
    final HttpClient httpClient = HttpClient();

    // Handle http:// URLs by converting to https://
    String downloadUrl = url;
    if (url.startsWith('http://')) {
      downloadUrl = url.replaceFirst('http://', 'https://');
    }

    final HttpClientRequest request = await httpClient.getUrl(Uri.parse(downloadUrl));
    final HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      final File file = File(filePath);
      final IOSink sink = file.openWrite();
      await response.pipe(sink);
      await sink.close();
    } else {
      throw Exception('Failed to download: HTTP ${response.statusCode}');
    }
  }

  /// Try to download a file, return false if not found
  Future<bool> _tryDownloadFile(String url, String filePath) async {
    try {
      final HttpClient httpClient = HttpClient();
      final HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      final HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        final File file = File(filePath);
        final IOSink sink = file.openWrite();
        await response.pipe(sink);
        await sink.close();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}

