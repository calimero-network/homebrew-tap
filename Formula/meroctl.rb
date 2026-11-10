class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.14/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "cc308d160ae0275723f6602f78fc288c98ab71b95589201a6b61f3d2bca7318f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.14"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.14/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b47bac9bfdfe74f5a6d43b41aae0b875d9d3f84e7418c23943bb91134edfbd70"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.14/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e0daef3a73743180d06a7197ab5955a881e86b7ca48c00d96963691dddfb0b95"
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
