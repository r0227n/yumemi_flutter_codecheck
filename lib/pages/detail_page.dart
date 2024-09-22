import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../repository/github.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.item, {super.key});

  final RepositoryItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: CachedNetworkImage(
                imageUrl: item.owner.avatarUrl,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            title: Text(item.fullName),
            subtitle: item.owner.name != null ? Text(item.owner.name ?? '') : null,
          ),
          Text(item.description ?? 'description'),
          Text(item.language ?? 'language'),
          Text(item.stargazersCount.toString()),
          Text(item.watchersCount.toString()),
          Text(item.forksCount.toString()),
          Text(item.openIssuesCount.toString()),
        ],
      ),
    );
  }
}


// リポジトリ名
// オーナーアイコン
// プロジェクト言語
// Star数
// Watcher数
// Fork数
// Issue数