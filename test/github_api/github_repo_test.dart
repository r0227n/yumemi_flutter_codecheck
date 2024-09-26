import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:yumemi_flutter_codecheck/repository/github.dart';
import 'github_repo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GithubRepoRepository>()])
void main() {
  late MockGithubRepoRepository mockRepository;

  setUp(() {
    mockRepository = MockGithubRepoRepository();
  });

  group('GithubRepoRepository Tests', () {
    test('search returns SearchResponse', () async {
      final response = await mockRepository.search('flutter');

      expect(response, isA<SearchResponse>());
    });

    test('get returns Repository', () async {
      final repositoryResult = await mockRepository.get('owner/repo');

      expect(repositoryResult, isA<Repository>());
    });

    test('getIssues returns IssueCount', () async {
      final issueCount = await mockRepository.getIssues(owner: 'owner', name: 'repo');

      expect(issueCount.openCount, isA<int>());
      expect(issueCount.closedCount, isA<int>());
    });
    test('getLicense should return a valid LicenseContent object', () async {
      final result = await mockRepository.getLicense('flutter/flutter');

      expect(result, isA<LicenseContent>());
    });
    test('getIssues should return IssueCount when called successfully', () async {
      final result = await mockRepository.getIssues(owner: 'flutter', name: 'flutter');

      expect(result.openCount, isA<int>());
      expect(result.closedCount, isA<int>());
    });
  });
}
