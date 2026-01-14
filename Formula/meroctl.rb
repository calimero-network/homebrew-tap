class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "a1bc677846e860a5b0e7d45b089cd03759994c6329f8542ed230009f91c48996"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a7bb6f3d646097029b47e57c017a511cd90d5e62e41b67f89aa324de96eea4b3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e589090a8108735f551dd43620e112bf6b4becd766195f0e011df23409de3f38"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "Meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
