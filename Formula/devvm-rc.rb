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
      url "https://github.com/devvmhq/devvm/releases/download/v0.2.0-rc.1/devvm-0.2.0-rc.1-darwin-arm64.tar.gz"
      sha256 "de6fd5665778ff59e315cb62b5fc285582ea50d4457b950c049111a4fc3b01ca"
    end
    on_intel do
      url "https://github.com/devvmhq/devvm/releases/download/v0.2.0-rc.1/devvm-0.2.0-rc.1-darwin-amd64.tar.gz"
      sha256 "7fccd612489725198df2ba67a10c27620ac1443a7104d90b0cf7c558d6f4afeb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devvmhq/devvm/releases/download/v0.2.0-rc.1/devvm-0.2.0-rc.1-linux-arm64.tar.gz"
      sha256 "e6bd26e17f4acad7d02e5bfce531156e61fd8719d9926b76c6aa8afcd8f65cfe"
    end
    on_intel do
      url "https://github.com/devvmhq/devvm/releases/download/v0.2.0-rc.1/devvm-0.2.0-rc.1-linux-amd64.tar.gz"
      sha256 "431d7d6fb90e89468ab7ad73f28afdc75aa9ca5223d9ac2688a038b9338ec2d8"
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
