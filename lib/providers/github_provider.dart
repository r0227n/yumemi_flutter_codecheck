import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../environment/secrets.dart';
import '../repository/github.dart';
import '../models/repository_detail.dart';

part 'github_provider.g.dart';

@riverpod
GitHubRepoRepository gitHubRepo(GitHubRepoRef ref) {
  return GitHubRepoRepository(Env.githubToken);
}

@riverpod
FutureOr<RepositoryDetail> repositoryDetail(RepositoryDetailRef ref, String fullName) async {
  final repoRepository = ref.watch(gitHubRepoProvider);

  final repositoryName = fullName.split('/');

  final (Repository repository, IssueCount issue, String? licenseUrl) = await (
    repoRepository.get(fullName),
    repoRepository.getIssues(owner: repositoryName.first, name: repositoryName.last),
    repoRepository.getLicense(fullName).then((value) => value.htmlUrl).catchError((_) => null)
  ).wait;

  return RepositoryDetail(
    id: repository.id,
    ownerIconUrl: repository.owner.avatarUrl,
    ownerName: repository.owner.name,
    fullName: repository.fullName,
    title: repository.name,
    description: repository.description,
    language: repository.language,
    isPrivate: repository.private,
    homepage: repository.homepage,
    license: repository.license,
    licenseUrl: licenseUrl,
    starCount: repository.stargazersCount,
    forkCount: repository.forksCount,
    watchCount: repository.subscribersCount,
    openIssueCount: issue.openCount,
    closedIssueCount: issue.closedCount,
  );
}
