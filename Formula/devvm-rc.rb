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
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.1-rc.2/devvm-0.1.1-rc.2-darwin-arm64.tar.gz"
      sha256 "8f390245bb1e9c7fd95b9345781586de20fda95d3cd9d2ddf4836edd339bcd49"
    end
    on_intel do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.1-rc.2/devvm-0.1.1-rc.2-darwin-amd64.tar.gz"
      sha256 "b2a6720be3d7bd5898dd3242895b1671b7bc14ec5e73822a18d3f5db53b11cbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.1-rc.2/devvm-0.1.1-rc.2-linux-arm64.tar.gz"
      sha256 "97b4f2f42c57a9d04af6d717f463200a42fcb78bb6245e790ed3642bd25b47ef"
    end
    on_intel do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.1-rc.2/devvm-0.1.1-rc.2-linux-amd64.tar.gz"
      sha256 "cb8254b6f704cc3f3cd85144166d68b87391fc3bc2d48224859bb13afca16007"
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
