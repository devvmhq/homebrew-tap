# devvmhq/tap

The Homebrew tap for [devvm](https://github.com/devvmhq/devvm), which gives each project folder an isolated VM of its own.

```sh
brew trust --formula devvmhq/tap/devvm
brew install devvmhq/tap/devvm
```

Homebrew installs Lima with it. Then run `devvm doctor`, which checks what devvm needs on your machine. [Installing](https://devvm.dev/docs/getting-started/install/) has the requirements and the other ways to install devvm.

Each devvm release writes `Formula/devvm.rb` here, built from `packaging/homebrew/devvm.rb` in the devvm repo, so changes to the formula go there.
