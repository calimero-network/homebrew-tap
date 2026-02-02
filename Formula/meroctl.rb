class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.39"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "e516f1eb82ec7c3f8de8438471e682ec937895c2c3f446a8307b0c95d11c95d2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9f892abba8d03271657a44e6c5a25b7ce70b773ec887b9cfb43e56e4fce2df11"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "895a8f14edeb3846d3a038bbad0640440a2c833b522fd29b96012692fddee363"
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
