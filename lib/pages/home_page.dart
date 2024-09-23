import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/l10n/l10n.dart';
import 'repository_detail_page.dart';
import '../widgets/search_app_bar.dart';
import '../view_model/github_search_view_model.dart';
import '../repository/github.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final githubRepository = ref.watch(gitHubSearchViewModelProvider);

    return Scaffold(
      appBar: SearchAppBar(
        hintText: context.l10n.searchLabel([context.l10n.repository].labels),
        actions: [
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
        onChanged: (value) {
          ref.read(gitHubSearchViewModelProvider.notifier).searchRepository(value);
        },
      ),
      body: githubRepository.when(
        data: (List<SearchItem> items) {
          return ListView(
            children: [
              if (items.isEmpty)
                const Center(child: Text('isEmpty')) // TODO: いい感じのUIにする
              else
                for (final i in items)
                  switch (i) {
                    RepositoryItem() => ProviderScope(
                        overrides: [currentRepositoryProvider.overrideWithValue(i)],
                        child: const RepositoryListItem(),
                      ),
                  }
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text(error.toString()),
      ),
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

class RepositoryListItem extends ConsumerWidget {
  const RepositoryListItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(currentRepositoryProvider);

    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: repository.owner.avatarUrl,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      title: Text(
        repository.name,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            repository.description ?? '',
            maxLines: 1,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          if (repository.language != null)
            Chip(
              label: Text(repository.language ?? ''),
            ),
        ],
      ),
      isThreeLine: true,
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RepositoryDetailPage(repository),
          ),
        );
      },
    );
  }
}
