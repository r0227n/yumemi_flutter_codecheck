import 'package:yumemi_flutter_codecheck/repository/github.dart';

class RepositoryDetail {
  const RepositoryDetail({
    required this.id,
    required this.ownerIconUrl,
    this.ownerName,
    required this.fullname,
    required this.title,
    this.description,
    this.language,
    required this.isPrivate,
    this.homepage,
    this.license,
    this.licenseUrl,
    required this.starCount,
    required this.forkCount,
    required this.watchCount,
    required this.openIssueCount,
    required this.closedIssueCount,
  });

  final int id;
  final String ownerIconUrl;
  final String? ownerName;
  final String fullname;
  final String title;
  final String? description;

  final String? language;
  final bool isPrivate;
  final String? homepage;

  final License? license;
  final String? licenseUrl;

  final int starCount;
  final int forkCount;
  final int watchCount;
  final int openIssueCount;
  final int closedIssueCount;
}
