class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.45"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.45/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "5fe93c694305edab900b3664e3113cec365cd1e2463f48b848dc0a1d9d86767e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.45"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.45/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "12cff529bbd01bfaf0e360de840ce5fc80f29732c84d3a1a17ba5e9f8d3870ef"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.45/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "961033ab27da9907a432d9ed6751d767deb755540726894b345d8c30867d4bcc"
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
