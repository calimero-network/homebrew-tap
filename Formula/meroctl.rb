class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "419a8beb97c9c5464ebe5060741d781101a6141ad682fa08db77a634e635bc81"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "9afd5419d2d189504018b20a195f779a0a6fa92e2cc0769acbccbe7c61b1e522"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3aded57f3c973d38989735145a623b8da273a93fb924f5dd0132c86bb9eac0a3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2d9a3a17becd577d3974d6922818ff0e9b086f4a304a69e450293f20a0dda60b"
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
