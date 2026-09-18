class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.40"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.40/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "05ef314b4f43a9633334e376a60fffc74c65aa8fb14da04945c32cac08cc53bb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.40"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.40/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "115d5569de9a86981161c9c0bb4e21bcee6ab1fcd0bc0ee8f0eb8dde45dff9a2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.40/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2101e4a7698c403f603001938a65e391195e5d3e4ad68e40031de1cac9df3f26"
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
