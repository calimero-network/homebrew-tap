class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "4ea590f6811be28cbfd35a5f0bffaf2fbc1b6639ab62f70f6356186dc823bafd"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "cd21e2df5530749e6b056345da4b9a8dc042cef645c9bca78998e4c23cf88e34"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6bbc8d6a212eff01202eef157df9b6865ccae848a7998dfaced3e28d7635072f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7b5866323d1bbb947df73ca2acf40597e0f6858e625af8c7cdf05dbf6028d136"
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
