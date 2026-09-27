class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.54"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.54/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "f4b0086becc26e0d871b6405187518791f3cd473d6f667cec040b510586a20b4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.54"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.54/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a57c345ea466c4bf858d8750508e7b4c8acefe24c6d2ed0ddb572a34e8056741"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.54/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3dcde859f293de4b0f5d85ef9dfa2c17f967ac24e3888df60734bfaacaf4e5e5"
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
