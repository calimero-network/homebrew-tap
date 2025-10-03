class Merobox < Formula
  desc "Calimero Network toolbox for integration and E2E testing"
  homepage "https://github.com/calimero-network/merobox"
  version "0.1.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/merobox/releases/download/v0.1.23/merobox_aarch64-apple-darwin.tar.gz"
    sha256 :no_check
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/merobox/releases/download/v0.1.23/merobox_x86_64-apple-darwin.tar.gz"
    sha256 :no_check
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/merobox/releases/download/v0.1.23/merobox_aarch64-unknown-linux-gnu.tar.gz"
    sha256 :no_check
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/merobox/releases/download/v0.1.23/merobox_x86_64-unknown-linux-gnu.tar.gz"
    sha256 :no_check
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merobox"
  end

  test do
    assert_match "merobox", shell_output("#{bin}/merobox --help")
  end
end


