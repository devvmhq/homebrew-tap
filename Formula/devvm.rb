# The formula for the devvmhq/homebrew-tap repo. scripts/release.sh fills in each platform's
# @URL_<OS>_<ARCH>@ and @SHA256_<OS>_<ARCH>@ from the release's SHA256SUMS, and writes the result to
# dist/devvm.rb. It installs the release's binary, which SHA256SUMS.minisig signs. Homebrew reads the
# version from the URLs (devvm-<version>-<os>-<arch>.tar.gz).
class Devvm < Formula
  desc "Isolated Lima VM per project folder, with shared read-only toolchains"
  homepage "https://github.com/devvmhq/devvm"
  license "MIT"

  depends_on "lima"

  on_macos do
    on_arm do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.0/devvm-0.1.0-darwin-arm64.tar.gz"
      sha256 "8a1ac86fa25b7d72399a5fa08b0baf5fac71dd5a0ddd8985d7be0a75c908a855"
    end
    on_intel do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.0/devvm-0.1.0-darwin-amd64.tar.gz"
      sha256 "02bca134c16b0595d7a593b5eaa135fd6de0ccf1e1c3edd04c04a14cac609526"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.0/devvm-0.1.0-linux-arm64.tar.gz"
      sha256 "7f5c4c5c43b2d9a24bc2c394b54d31659ad1782ff0067e5a46fd918883c41440"
    end
    on_intel do
      url "https://github.com/devvmhq/devvm/releases/download/v0.1.0/devvm-0.1.0-linux-amd64.tar.gz"
      sha256 "fc939a651614917404766c8bf1c7f64aed8c136605e133e0602c55101a82284c"
    end
  end

  def install
    bin.install "devvm"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/devvm --version").strip
  end
end
