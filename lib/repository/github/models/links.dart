class Links {
  const Links({
    this.git,
    this.html,
    required this.self,
  });

  final String? git;
  final String? html;
  final String self;

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      git: json['git'],
      html: json['html'],
      self: json['self'],
    );
  }
}
