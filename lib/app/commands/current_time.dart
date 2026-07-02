import 'package:intl/intl.dart';
import 'package:nylo_framework/metro/ny_cli.dart';

void main(List<String> arguments) => _CurrentTimeCommand(arguments).run();

/// Current Time Command
///
/// Usage:
///   [From Terminal] metro app:current_time
class _CurrentTimeCommand extends NyCustomCommand {
  _CurrentTimeCommand(super.arguments);

  @override
  CommandBuilder builder(CommandBuilder command) {
    command.addOption('format', defaultValue: 'HH:mm:ss');
    return command;
  }

  @override
  Future<void> handle(CommandResult result) async {
    final String? format = result.getString("format");

    // Get the current time
    final DateTime now = DateTime.now();
    final DateFormat dateFormat = DateFormat(format);

    // Format the current time
    final String formattedTime = dateFormat.format(now);
    info("The current time is $formattedTime");
  }
}
