class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.38"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.38/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "f538339dab87298d0f89f5be02de86ae230ac928821056a949530145c4c1ac4e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.38/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "557e7b474b2cabb8cb7463c7322325c1c8c75aee28c1918e043a537a9a9a40e0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.38/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "334f64bf2c38c3f626e5b65ba2c539782fa46d20e7dad944dc4155a274c42439"
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
