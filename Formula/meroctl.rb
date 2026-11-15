class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.28/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "f55df7c51a62d644d86776d95443f229f06c497872becb8892a47a78f7393cfc"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.28 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.28/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b363fe13f0b9ff5ddb975e4a072e6b7db6480d8fb52816ff2707e1717c3ca125"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.28/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4e6380330c285ace3d1887915f63608840ac49e5ebd1302a6c72979b004788c6"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/meroctl --version")
  end
end
