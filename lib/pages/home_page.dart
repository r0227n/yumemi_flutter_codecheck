import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:yumemi_flutter_codecheck/l10n/arb/l10n.dart';
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

  late final SearchController _searchCtrl;

  @override
  void initState() {
    super.initState();
    repoRepository = GithubRepoRepository(Env.githubToken);
    // TODO: 初期検索は仮極めのため、いい感じにする
    _futureRepoItems = searchRepository('dart');

    _searchCtrl = SearchController();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<List<GitHubItem>> searchRepository(String word) async {
    final response = await repoRepository.search(word);

    return response.items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SearchAnchor(
            searchController: _searchCtrl,
            builder: (BuildContext context, SearchController controller) {
              return IconButton(
                icon: const Icon(Icons.search_outlined),
                tooltip: context.l10n.search,
                onPressed: () {
                  controller.openView();
                },
              );
            },
            suggestionsBuilder: (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = index == 0 ? '' : 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            },
            viewOnSubmitted: (value) {
              setState(() {
                _searchCtrl.closeView(value);
              });
            },
          ),
          MenuAnchor(
            menuChildren: <Widget>[
              MenuItemButton(
                leadingIcon: const Icon(Icons.language),
                child: Text(context.l10n.languageSettings),
                onPressed: () {
                  _languageSelectDialog(context);
                },
              ),
            ],
            child: const Text('Background Color'),
            builder: (BuildContext context, MenuController controller, Widget? child) {
              return IconButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                tooltip: context.l10n.settings,
                icon: const Icon(Icons.settings_outlined),
              );
            },
          ),
        ],
      ),
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

  Future<void> _languageSelectDialog(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(Icons.language),
          title: Text(context.l10n.languageSettings),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    for (final locale in AppLocalizations.supportedLocales)
                      RadioListTile<Locale>(
                        value: locale,
                        groupValue: currentLocale,
                        onChanged: (newLocale) {
                          if (newLocale != null) {
                            setState(() => currentLocale = newLocale);
                          }
                        },
                        title: Text(locale.toLabel(context)),
                      ),
                  ],
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(context.l10n.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(context.l10n.save),
              onPressed: () {
                // 選択されたロケールを保存する処理を追加
                // 例: AppLocalizations.load(selectedLocale);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
