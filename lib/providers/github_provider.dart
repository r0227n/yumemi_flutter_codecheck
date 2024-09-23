import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../environment/secrets.dart';
import '../repository/github.dart';

part 'github_provider.g.dart';

@riverpod
GithubRepoRepository gitHubRepo(GitHubRepoRef ref) {
  return GithubRepoRepository(Env.githubToken);
}
