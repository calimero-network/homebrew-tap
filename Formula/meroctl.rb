class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "ed125db1376d37c47b5348251aea103425110707efb717ae4f911e36984347b6"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "b4b52b6fd553874c3e772bf0326dd32a742293d2818210238aa01119a092b306"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3c44633a27b50db274f9b207204a6dbebe998d21abd757438d13863ea777f352"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ca8d80a29a19b858f1db96e9cc4706ea0f2df27cc0b4350a6a972c796b63a5aa"
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
