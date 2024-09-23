import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/l10n/l10n.dart';
import '../widgets/icon_text.dart';
import '../providers/github_provider.dart';

typedef RepositoryAbountTile = ({
  Widget icon,
  int count,
  String unit,
  String tooltip,
});

class RepositoryDetailPage extends ConsumerWidget {
  const RepositoryDetailPage(this.fullName, {super.key});

  final String fullName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repoDetail = ref.watch(repositoryDetailProvider(fullName));

    return Scaffold(
      appBar: AppBar(
        title: Text(fullName),
      ),
      body: repoDetail.when(
        data: (repo) {
          final abountWraps = <RepositoryAbountTile>[
            (
              icon: const Icon(Icons.star),
              count: repo.starCount,
              unit: 'stars',
              tooltip: 'Stared',
            ),
            (
              icon: const Icon(Icons.fork_left),
              count: repo.forkCount,
              unit: 'forks',
              tooltip: 'Fork'
            ),
            (
              icon: const Icon(Icons.visibility),
              count: repo.watchCount,
              unit: 'watching',
              tooltip: 'Watch'
            ),
            (
              icon: const Icon(Icons.adjust),
              count: repo.openIssueCount,
              unit: 'issues',
              tooltip: 'Open Issues',
            ),
          ];

          final abountLists = <IconTextItem>[
            if (repo.homepage != null)
              (
                icon: const Icon(Icons.link),
                title: Uri.parse(repo.homepage!).host,
                url: repo.homepage
              ),
            if (repo.licenseUrl != null)
              (
                icon: const Icon(Icons.balance),
                title: repo.license?.name ?? 'License',
                url: repo.licenseUrl
              ),
          ];

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            children: [
              ListTile(
                leading: CachedNetworkImage(
                  imageUrl: repo.ownerIconUrl,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                title: Text(
                  repo.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                subtitle: repo.ownerName != null ? Text(repo.ownerName!) : null,
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
              if (repo.description != null) Text(repo.description!),
              for (final tile in abountLists)
                IconText(
                  icon: tile.icon,
                  title: Text(
                    tile.title,
                    style: tile.url != null ? const TextStyle(color: Color(0xFF1389FD)) : null,
                  ),
                  onPressed: tile.url != null ? () => launchUrl(Uri.parse(tile.url!)) : null,
                ),
              Wrap(
                children: [
                  for (final abount in abountWraps)
                    Tooltip(
                      message: abount.tooltip,
                      child: Chip(
                        avatar: abount.icon,
                        label: Text.rich(
                          TextSpan(
                            text: abount.count.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' ${abount.unit}',
                                style: const TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        side: BorderSide.none,
                      ),
                    ),
                ],
              ),
              IconText(
                icon: repo.isPrivate ? const Icon(Icons.public_off) : const Icon(Icons.public),
                title: Text(
                  '${repo.isPrivate ? context.l10n.private : context.l10n.public} ${context.l10n.repository}',
                ),
                onPressed: null,
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text(error.toString()), // TODO: エラー画面を作成する
      ),
    );
  }
}
