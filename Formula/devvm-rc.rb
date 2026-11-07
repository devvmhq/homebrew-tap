# devvm's newest prerelease, such as a release candidate, for trying before its release. The devvm
# formula has the newest release. Both install the devvm command, so install one or the other.
# Made from devvm's scripts/release.sh --formula-from, with the release's signed SHA256SUMS.
class DevvmRc < Formula
  desc "Isolated Lima VM per project folder, with shared toolchains (prerelease)"
  homepage "https://github.com/devvmhq/devvm"
  license "MIT"

  depends_on "lima"

  on_macos do
    on_arm do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.1-rc.1/devvm-0.1.1-rc.1-darwin-arm64.tar.gz"
      sha256 "2fd4c1ecaddea29b03b6b84c42c0345716a8da3a1bbf6625d4a02a2b6243b60e"
    end
    on_intel do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.1-rc.1/devvm-0.1.1-rc.1-darwin-amd64.tar.gz"
      sha256 "7d501a340d1a579b78ac15138d928c88929fe3ac3b9ae50ccad7e4eeb248df8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.1-rc.1/devvm-0.1.1-rc.1-linux-arm64.tar.gz"
      sha256 "76d0076dee391269e43b0a4e5e596d06ac5c8136b1cebb2da6c7e2a9e1b62613"
    end
    on_intel do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.1-rc.1/devvm-0.1.1-rc.1-linux-amd64.tar.gz"
      sha256 "8f1c12669910a45c5b5b5a18e77df8d27b13958f0bd760d25b59af8a24e6898f"
    end
  end

  conflicts_with "devvm", because: "both install the devvm command"

  def install
    bin.install "devvm"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/devvm --version").strip
  end
end
