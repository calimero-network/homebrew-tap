class Merobox < Formula
  desc "Calimero Network toolbox for integration and E2E testing"
  homepage "https://github.com/calimero-network/merobox"
  version "0.1.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/merobox/releases/download/v0.1.23/merobox-v0.1.23-darwin-arm64"
    sha256 "00d1f3ce345cc2caa78116a838b0edb9c8d2fa50d65185c23c858ba1851f0e84"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/merobox/releases/download/v0.1.23/merobox-v0.1.23-darwin-x64"
    sha256 "0446cdb61dda50778495df1f14dd5d2d958bcc6bb08b435087fbd4ec513804e4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/merobox/releases/download/v0.1.23/merobox-v0.1.23-linux-arm64"
    sha256 "19210651003e655cb312f0ed2a6af451ed7c758ac55eccdcd5b3201bdec0aba1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/merobox/releases/download/v0.1.23/merobox-v0.1.23-linux-x64"
    sha256 "cbcda02182f6c904d0213efe1315476e11180d622a35b4ad48e2707e89a334be"
  else
    odie "Unsupported platform"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "merobox-v0.1.23-darwin-arm64" => "merobox"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "merobox-v0.1.23-darwin-x64" => "merobox"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "merobox-v0.1.23-linux-arm64" => "merobox"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "merobox-v0.1.23-linux-x64" => "merobox"
    else
      odie "Unsupported platform"
    end
  end

  test do
    assert_match "merobox", shell_output("#{bin}/merobox --help")
  end
end