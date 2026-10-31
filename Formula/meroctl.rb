class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.7/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "229aff1490e1b5db0d206c1056ae4ddfd2be38390d76b2e71a2fb0fb694fce45"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.7/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1f7947238a28b79d4153e972c7bff1d9766a3d1ef0c3e518ece9210ee6188454"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.7/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "495865b3de25ceb7a0483e8982ec51627a73cd75137b6c58d6aa8aaa159caf6e"
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
