class Organization {
  final String avatarUrl;
  final String eventsUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String gravatarId;
  final String htmlUrl;
  final int id;
  final String login;
  final String nodeId;
  final String organizationsUrl;
  final String receivedEventsUrl;
  final String reposUrl;
  final bool siteAdmin;
  final String starredUrl;
  final String subscriptionsUrl;
  final String type;
  final String url;

  Organization({
    required this.avatarUrl,
    required this.eventsUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.gravatarId,
    required this.htmlUrl,
    required this.id,
    required this.login,
    required this.nodeId,
    required this.organizationsUrl,
    required this.receivedEventsUrl,
    required this.reposUrl,
    required this.siteAdmin,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.type,
    required this.url,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      avatarUrl: json['avatar_url'],
      eventsUrl: json['events_url'],
      followersUrl: json['followers_url'],
      followingUrl: json['following_url'],
      gistsUrl: json['gists_url'],
      gravatarId: json['gravatar_id'],
      htmlUrl: json['html_url'],
      id: json['id'],
      login: json['login'],
      nodeId: json['node_id'],
      organizationsUrl: json['organizations_url'],
      receivedEventsUrl: json['received_events_url'],
      reposUrl: json['repos_url'],
      siteAdmin: json['site_admin'],
      starredUrl: json['starred_url'],
      subscriptionsUrl: json['subscriptions_url'],
      type: json['type'],
      url: json['url'],
    );
  }
}
