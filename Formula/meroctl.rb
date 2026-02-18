class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.49"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.49/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "66d0833fa96256b6b504c2207eb49f6375de1fa09f5667818ead71053104bdfc"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.49"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.49/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "080ea14dfbc89897050f40ac4661630692b347cab094dd7fa10356372f31b869"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.49/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b06a39b0f7ba4b288da5366f26222933bd783e2885819c9e2ae76fed575215cf"
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
