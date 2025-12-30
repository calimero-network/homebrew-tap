class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "f88a0c2101aece84a18e0c41689920d970bf70a0d1bc5127c5c6bf02d7aefa5f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "12516bb73442e82babd91f40e980b95ad67f2629e674d5e93707a586774b9891"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "398912e4dafb67b924b54252495282131699cdfd27926ad9cb00de8070ef0bfd"
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
