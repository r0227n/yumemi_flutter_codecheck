import 'license.dart';
import 'organization.dart';
import 'owner.dart';

class Repository {
  const Repository({
    required this.allowForking,
    required this.archiveUrl,
    required this.archived,
    required this.assigneesUrl,
    required this.blobsUrl,
    required this.branchesUrl,
    required this.cloneUrl,
    required this.collaboratorsUrl,
    required this.commentsUrl,
    required this.commitsUrl,
    required this.compareUrl,
    required this.contentsUrl,
    required this.contributorsUrl,
    this.createdAt,
    this.customProperties,
    required this.defaultBranch,
    required this.deploymentsUrl,
    this.description,
    required this.disabled,
    required this.downloadsUrl,
    required this.eventsUrl,
    required this.fork,
    required this.forks,
    required this.forksCount,
    required this.forksUrl,
    required this.fullName,
    required this.gitCommitsUrl,
    required this.gitRefsUrl,
    required this.gitTagsUrl,
    required this.gitUrl,
    required this.hasDiscussions,
    required this.hasDownloads,
    required this.hasIssues,
    required this.hasPages,
    required this.hasProjects,
    required this.hasWiki,
    this.homepage,
    required this.hooksUrl,
    this.htmlUrl,
    required this.id,
    required this.isTemplate,
    required this.issueCommentUrl,
    required this.issueEventsUrl,
    required this.issuesUrl,
    required this.keysUrl,
    required this.labelsUrl,
    this.language,
    required this.languagesUrl,
    required this.license,
    required this.mergesUrl,
    required this.milestonesUrl,
    this.mirrorUrl,
    required this.name,
    required this.networkCount,
    required this.nodeId,
    required this.notificationsUrl,
    required this.openIssues,
    required this.openIssuesCount,
    required this.organization,
    required this.owner,
    required this.private,
    required this.pullsUrl,
    this.pushedAt,
    required this.releasesUrl,
    required this.size,
    required this.sshUrl,
    required this.stargazersCount,
    required this.stargazersUrl,
    required this.statusesUrl,
    required this.subscribersCount,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.svnUrl,
    required this.tagsUrl,
    required this.teamsUrl,
    this.tempCloneToken,
    required this.topics,
    required this.treesUrl,
    this.updatedAt,
    this.url,
    required this.visibility,
    required this.watchers,
    required this.watchersCount,
    required this.webCommitSignoffRequired,
  });

  final bool allowForking;
  final String archiveUrl;
  final bool archived;
  final String assigneesUrl;
  final String blobsUrl;
  final String branchesUrl;
  final String cloneUrl;
  final String collaboratorsUrl;
  final String commentsUrl;
  final String commitsUrl;
  final String compareUrl;
  final String contentsUrl;
  final String contributorsUrl;
  final DateTime? createdAt;
  final Map<String, dynamic>? customProperties;
  final String defaultBranch;
  final String deploymentsUrl;
  final String? description;
  final bool disabled;
  final String downloadsUrl;
  final String eventsUrl;
  final bool fork;
  final int forks;
  final int forksCount;
  final String forksUrl;
  final String fullName;
  final String gitCommitsUrl;
  final String gitRefsUrl;
  final String gitTagsUrl;
  final String gitUrl;
  final bool hasDiscussions;
  final bool hasDownloads;
  final bool hasIssues;
  final bool hasPages;
  final bool hasProjects;
  final bool hasWiki;
  final String? homepage;
  final String hooksUrl;
  final String? htmlUrl;
  final int id;
  final bool isTemplate;
  final String issueCommentUrl;
  final String issueEventsUrl;
  final String issuesUrl;
  final String keysUrl;
  final String labelsUrl;
  final String? language;
  final String languagesUrl;
  final License license;
  final String mergesUrl;
  final String milestonesUrl;
  final String? mirrorUrl;
  final String name;
  final int networkCount;
  final String nodeId;
  final String notificationsUrl;
  final int openIssues;
  final int openIssuesCount;
  final Organization? organization;
  final Owner owner;
  final bool private;
  final String pullsUrl;
  final DateTime? pushedAt;
  final String releasesUrl;
  final int size;
  final String sshUrl;
  final int stargazersCount;
  final String stargazersUrl;
  final String statusesUrl;
  final int subscribersCount;
  final String subscribersUrl;
  final String subscriptionUrl;
  final String svnUrl;
  final String tagsUrl;
  final String teamsUrl;
  final String? tempCloneToken;
  final List<String> topics;
  final String treesUrl;
  final DateTime? updatedAt;
  final String? url;
  final String visibility;
  final int watchers;
  final int watchersCount;
  final bool webCommitSignoffRequired;

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      allowForking: json['allow_forking'],
      archiveUrl: json['archive_url'],
      archived: json['archived'],
      assigneesUrl: json['assignees_url'],
      blobsUrl: json['blobs_url'],
      branchesUrl: json['branches_url'],
      cloneUrl: json['clone_url'],
      collaboratorsUrl: json['collaborators_url'],
      commentsUrl: json['comments_url'],
      commitsUrl: json['commits_url'],
      compareUrl: json['compare_url'],
      contentsUrl: json['contents_url'],
      contributorsUrl: json['contributors_url'],
      createdAt: DateTime.tryParse(json['created_at']),
      customProperties: json['custom_properties'],
      defaultBranch: json['default_branch'],
      deploymentsUrl: json['deployments_url'],
      description: json['description'],
      disabled: json['disabled'],
      downloadsUrl: json['downloads_url'],
      eventsUrl: json['events_url'],
      fork: json['fork'],
      forks: json['forks'],
      forksCount: json['forks_count'],
      forksUrl: json['forks_url'],
      fullName: json['full_name'],
      gitCommitsUrl: json['git_commits_url'],
      gitRefsUrl: json['git_refs_url'],
      gitTagsUrl: json['git_tags_url'],
      gitUrl: json['git_url'],
      hasDiscussions: json['has_discussions'],
      hasDownloads: json['has_downloads'],
      hasIssues: json['has_issues'],
      hasPages: json['has_pages'],
      hasProjects: json['has_projects'],
      hasWiki: json['has_wiki'],
      homepage: json['homepage'],
      hooksUrl: json['hooks_url'],
      htmlUrl: json['html_url'],
      id: json['id'],
      isTemplate: json['is_template'],
      issueCommentUrl: json['issue_comment_url'],
      issueEventsUrl: json['issue_events_url'],
      issuesUrl: json['issues_url'],
      keysUrl: json['keys_url'],
      labelsUrl: json['labels_url'],
      language: json['language'],
      languagesUrl: json['languages_url'],
      license: License.fromJson(json['license']),
      mergesUrl: json['merges_url'],
      milestonesUrl: json['milestones_url'],
      mirrorUrl: json['mirror_url'],
      name: json['name'],
      networkCount: json['network_count'],
      nodeId: json['node_id'],
      notificationsUrl: json['notifications_url'],
      openIssues: json['open_issues'],
      openIssuesCount: json['open_issues_count'],
      organization:
          json['organization'] != null ? Organization.fromJson(json['organization']) : null,
      owner: Owner.fromJson(json['owner']),
      private: json['private'],
      pullsUrl: json['pulls_url'],
      pushedAt: DateTime.tryParse(json['pushed_at']),
      releasesUrl: json['releases_url'],
      size: json['size'],
      sshUrl: json['ssh_url'],
      stargazersCount: json['stargazers_count'],
      stargazersUrl: json['stargazers_url'],
      statusesUrl: json['statuses_url'],
      subscribersCount: json['subscribers_count'],
      subscribersUrl: json['subscribers_url'],
      subscriptionUrl: json['subscription_url'],
      svnUrl: json['svn_url'],
      tagsUrl: json['tags_url'],
      teamsUrl: json['teams_url'],
      tempCloneToken: json['temp_clone_token'],
      topics: List<String>.from(json['topics']),
      treesUrl: json['trees_url'],
      updatedAt: DateTime.tryParse(json['updated_at']),
      url: json['url'],
      visibility: json['visibility'],
      watchers: json['watchers'],
      watchersCount: json['watchers_count'],
      webCommitSignoffRequired: json['web_commit_signoff_required'],
    );
  }
}
