# yumemi_flutter_codecheck

## Abount This App

![App Demo](docs/assets/app_demo.gif)

- リポジトリ名を入力し、GitHub上のリポジトリを一覧表示&詳細表示するアプリ
- 対応言語: 日本語 / 英語

## 動作環境

```
Flutter 3.24.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 2663184aa7 (9 days ago) • 2024-09-11 16:27:48 -0500
Engine • revision 36335019a8
Tools • Dart 3.5.3 • DevTools 2.37.3
```

## 環境構築

### fvm

[fvm](https://fvm.app/documentation/getting-started/installation)を使用したFlutter環境の構築が完了していることが前提となります。

```bash
1. git clone https://github.com/r0227n/yumemi_flutter_codecheck.git
2. cd yumemi_flutter_codecheck
3. fvm use
```

### GitHub Personal Access Token

[公式ドキュメント](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token)に従い、GitHubのPersonal Access Tokenを発行する。

### .envファイルの作成

```.env
flavor="<dev or stg or prod >"
GITHUB_PAT="<GitHub の Personal Access Token>"
```

上記内容のファイルを`dart_defines`ディレクトリに作成する。
ファイル名は

- DEV向け: dev.env
- STG向け: stg.dev
- PROD向け: prod.dev

にすること。
