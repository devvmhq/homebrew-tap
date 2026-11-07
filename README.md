# devvmhq/tap

The Homebrew tap for [devvm](https://github.com/devvmhq/devvm), which gives each project folder an isolated VM of its own.

```sh
brew trust --formula devvmhq/tap/devvm
brew install devvmhq/tap/devvm
```

Homebrew installs Lima with it. Then run `devvm doctor`, which checks what devvm needs on your machine. [Installing](https://devvm.dev/docs/getting-started/install/) has the requirements and the other ways to install devvm.

## Trying a prerelease

`devvm-rc` is devvm's newest prerelease, such as a release candidate, for trying changes before they're released. It installs the same `devvm` command, so uninstall `devvm` first:

```sh
brew uninstall devvm
brew trust --formula devvmhq/tap/devvm-rc
brew install devvmhq/tap/devvm-rc
```

Update it with `brew upgrade devvm-rc`. To go back to the release, run `brew uninstall devvm-rc`, then `brew install devvmhq/tap/devvm`. [Trying a prerelease](https://next.devvm.dev/docs/using/upgrading/#trying-a-prerelease) has the other ways to try one.

## The formulas

Each devvm release writes `Formula/devvm.rb` here, and each prerelease `Formula/devvm-rc.rb`, built from `packaging/homebrew/devvm.rb` in the devvm repo, so changes to the formulas go there.
