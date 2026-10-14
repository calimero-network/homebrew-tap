class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.84"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.84/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "86225493ba01d32d6026d0c0ab7f96fe0fc04cf62e7edaf20bb3af672f5adc64"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.84"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.84/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2cddd068d828f9aefb9f776f329613c3577d3e35b54e68105be16fc723829827"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.84/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0c42a752114d8babbecbbc7ba90c48191738a41816995e77b8986f3760c834bb"
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
