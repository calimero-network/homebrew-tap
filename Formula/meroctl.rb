class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.28/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "db6f7150e709590acab5b16952be8ddb7dcd914b6ddece026763ab6bdf76c56d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.28/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9f4f8da11c5f9b6ef5a47d8aa07b92eab839f242fe6e50a1c9e3dc5b5ffafd05"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.28/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fc1c5b29819bf8ca2038e953cfbdf96a0c49889ce2a91fe217f55f940a96da42"
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
