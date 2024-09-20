class License {
  const License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  final String? key;
  final String? name;
  final String? spdxId;
  final String? url;
  final String? nodeId;

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      key: json['key'],
      name: json['name'],
      spdxId: json['spdx_id'],
      url: json['url'],
      nodeId: json['node_id'],
    );
  }
}
