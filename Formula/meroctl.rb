class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.5/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "abcd4e824318c5ac5ba26037fc11e557097475617865e54355fc910e9dffa30a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.5/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "db7347eb27ec8fc3f5cd4b85f5adb859391694d3bf53ddbfe7db373f27f93199"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.5/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d753b22f5a9fb0c6cc2646a149ea0309b1b7368a7a224478b5f3dc93b991bdff"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.5/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "03ed387d465983928bb0038986ba4757145e8562196c703c8b183f773cc13982"
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
