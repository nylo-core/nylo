/// The result of fetching a repository from the GitHub API.
///
/// It's either the [GithubRepo] or a [GithubError], decoded by the
/// `OneOf<GithubRepoResult>` in `bootstrap/decoders.dart`.
sealed class GithubRepoResult {}

/// A 200 response, e.g. https://api.github.com/repos/nylo-core/nylo
class GithubRepo extends GithubRepoResult {
  String? fullName;
  String? description;
  int? stargazersCount;

  GithubRepo.fromJson(dynamic data) {
    fullName = data['full_name'];
    description = data['description'];
    stargazersCount = data['stargazers_count'];
  }
}

/// Any other response, e.g. a 404 or a 403 when rate limited.
/// {"message": "Not Found", "documentation_url": "...", "status": "404"}
class GithubError extends GithubRepoResult {
  String? message;
  String? documentationUrl;

  GithubError.fromJson(dynamic data) {
    message = data['message'];
    documentationUrl = data['documentation_url'];
  }
}
