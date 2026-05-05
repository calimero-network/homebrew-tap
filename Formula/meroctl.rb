class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.33/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "1d66fc957f3518287d05a7adbe8cc41152c996b63714950379d54fd7bdfa9f86"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.33"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.33/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d160f74aff0f52d5543395fd8d1b0057e7f8e3cb9a5f2acd9dac1609e8e7fa42"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.33/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9323b11584ba54722f308eb35b54655c12fa2323494cb4e27b712037882aed3e"
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
