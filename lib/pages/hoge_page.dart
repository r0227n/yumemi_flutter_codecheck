import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:yumemi_flutter_codecheck/pages/detail_page.dart';
import '../environment/secrets.dart';
import '../repository/github.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final GithubRepoRepository repoRepository;
  late Future<List<GitHubItem>> _futureRepoItems;

  @override
  void initState() {
    super.initState();
    repoRepository = GithubRepoRepository(Env.githubToken);
    // TODO: 初期検索は仮極めのため、いい感じにする
    _futureRepoItems = searchRepository('dart');
  }

  Future<List<GitHubItem>> searchRepository(String word) async {
    final response = await repoRepository.search(word);

    return response.items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: _futureRepoItems,
          builder: (context, snapshot) {
            return switch ((snapshot.connectionState, snapshot.data)) {
              (ConnectionState.done, List<RepositoryItem> repos) => Scrollbar(
                  child: ListView(
                    children: [
                      for (final i in repos)
                        ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: i.owner.avatarUrl,
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                          title: Text(
                            i.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                i.description,
                                maxLines: 1,
                                style: const TextStyle(overflow: TextOverflow.ellipsis),
                              ),
                              Chip(
                                label: Text(i.language),
                              ),
                            ],
                          ),
                          isThreeLine: true,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailPage(i),
                            ));
                          },
                        )
                    ],
                  ),
                ),
              (ConnectionState.waiting, _) => const Center(child: CircularProgressIndicator()),
              _ => const Text('Error'),
            };
          }),
    );
  }
}
