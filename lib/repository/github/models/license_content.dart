import 'license.dart';
import 'links.dart';

class LicenseContent {
  const LicenseContent({
    required this.name,
    required this.path,
    required this.sha,
    required this.size,
    required this.url,
    this.htmlUrl,
    this.gitUrl,
    this.downloadUrl,
    required this.type,
    required this.content,
    required this.encoding,
    required this.links,
    this.license,
  });

  final String name;
  final String path;
  final String sha;
  final int size;
  final String url;
  final String? htmlUrl;
  final String? gitUrl;
  final String? downloadUrl;
  final String type;
  final String content;
  final String encoding;
  final Links links;
  final License? license;

  factory LicenseContent.fromJson(Map<String, dynamic> json) {
    return LicenseContent(
      name: json['name'],
      path: json['path'],
      sha: json['sha'],
      size: json['size'],
      url: json['url'],
      htmlUrl: json['html_url'],
      gitUrl: json['git_url'],
      downloadUrl: json['download_url'],
      type: json['type'],
      content: json['content'],
      encoding: json['encoding'],
      links: Links.fromJson(json['_links']),
      license: json['license'] != null ? License.fromJson(json['license']) : null,
    );
  }
}
