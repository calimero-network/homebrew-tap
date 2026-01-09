class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "27a41390882eef109c8eae6cef6b3ed878ab52a52629a2837be62f155a2e4d63"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e97b01b37ed8a5de92065a114eeed7f47b5fe2ff88885ab80d6477e830d02bf4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e83dc20d13546b97902579c28020c962567ab5bd58268c8ae5d701d50d193038"
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
