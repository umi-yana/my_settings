
# sheldon

zsh のプラグインマネージャー `sheldon` のセットアップと運用について

## 前提

- OS: macOS
- Shell: zsh
- Homebrew が利用可能

## インストール

```bash
brew install sheldon
```

確認:

```bash
sheldon --version
```

## 設定ファイル配置

このリポジトリの設定ファイルは次にあります。

`terminal/config/sheldon/plugins.toml`

実際に `sheldon` が読む場所は `~/.config/sheldon/plugins.toml` です。

## .zshrc 連携

`~/.zshrc` に次を入れると、シェル起動時にプラグインが読み込まれます。

```zsh
eval "$(sheldon source)"
```

このリポジトリでは `terminal/.zshrc` に既に記載済みです。

## プラグイン管理

設定編集:

```bash
sheldon edit
```

プラグイン追加例:

```bash
sheldon add zsh-autosuggestions --github zsh-users/zsh-autosuggestions
```

プラグイン削除例:

```bash
sheldon remove zsh-autosuggestions
```

現在の設定を zsh 向けスクリプトとして確認:

```bash
sheldon source
```

## このリポジトリのポイント

- `terminal/config/sheldon/plugins.toml` では `shell = "zsh"` を指定
- `zsh-defer` テンプレートを使って一部プラグインを遅延ロード
- `compinit` も `zsh-defer` で実行し、起動コストを抑える

## 参考

- https://sheldon.cli.rs/
- https://sheldon.cli.rs/Examples.html