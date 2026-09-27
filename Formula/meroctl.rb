class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.53"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.53/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b457464b4d4ec8871450b4916b2731fcff6a35ed795da8adbca11507e533af4e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.53"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.53/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6c35d6adb69a7f8de97cf061f94778f0e5632a1d2bc054d4b7236eb053fd8add"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.53/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e1e1d6e7fe34f7374f6621bc932754c6a6b7e77641b4b853db9f964959940f81"
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
