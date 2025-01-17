class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.3.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/meroctl-0.3.0/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "5f12e6029572fe698aac10574e7b16d9f39f09643c198cfbc4611a7a03c56293"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/meroctl-0.3.0/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0ebea70a716af8f0e3c1b3f4ed530476be900111378da14c13fcbef5d50a3cc3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/meroctl-0.3.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2347795f1335657f42ac138e67948cb7aa97fb616fd1e38aaea7120c7159c4eb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/meroctl-0.3.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "505d397f09dbcb4615c601838f482f21ef8f1d84f44d11a560c57c456a1d7166"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
