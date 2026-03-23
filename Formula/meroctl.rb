class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.7/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "05ea92ef54a5ef8c2f7624cf63ac2dbac289cc71552c911e26ba10679115da24"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.7/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3cdcc140548cbb1c8f71cfe6733c965389cf2b773ba6c61163b2d9703d8a4e0c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.7/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "98f008be4ad6511533b1c1b1daaa99d1e1398147bf5f0ab5e14a6cde41702b14"
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
