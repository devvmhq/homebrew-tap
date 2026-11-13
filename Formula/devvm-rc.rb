# The formulas for the devvmhq/homebrew-tap repo: devvm, a release's, and devvm-rc, the newest
# prerelease's or release's. scripts/release.sh fills in @CLASS@ and @CONFLICTS@ for each formula, and
# each platform's @URL_<OS>_<ARCH>@ and @SHA256_<OS>_<ARCH>@ from the release's SHA256SUMS, and writes the
# result to dist/devvm.rb or dist/devvm-rc.rb. It installs the release's binary, which SHA256SUMS.minisig
# signs. Homebrew reads the version from the URLs (devvm-<version>-<os>-<arch>.tar.gz).
class DevvmRc < Formula
  desc "Isolated Lima VM per project folder, with shared read-only toolchains"
  homepage "https://github.com/devvmhq/devvm"
  license "MIT"

  depends_on "lima"

  on_macos do
    on_arm do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.1-rc.3/devvm-0.1.1-rc.3-darwin-arm64.tar.gz"
      sha256 "437d837b8c7e46439aca400ee6f65622aea78fcec5e13eb3511bf8510b4a63a4"
    end
    on_intel do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.1-rc.3/devvm-0.1.1-rc.3-darwin-amd64.tar.gz"
      sha256 "a77d1710aa45a88de5a16b80b17ed2e9f94b35bc6f85c1809216d88ad1056c07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.1-rc.3/devvm-0.1.1-rc.3-linux-arm64.tar.gz"
      sha256 "eff74306bd822d3388f714579d6a7222d0ef83bd50e5358f438f9965e5df2c0d"
    end
    on_intel do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.1-rc.3/devvm-0.1.1-rc.3-linux-amd64.tar.gz"
      sha256 "3bf88135df67e77e730aee84e27ade0358d5854257e464016b0bc1b9205a6d05"
    end
  end

  conflicts_with "devvmhq/tap/devvm", because: "both install the devvm binary"

  def install
    bin.install "devvm"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/devvm --version").strip
  end
end
