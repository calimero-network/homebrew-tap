class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.72"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.72/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "89dc39d2340f1da433abcdde28874d2ff460a77692cb5ae94b4bb8f95acf93cc"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.72"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.72/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fa134e988f1dec6508a54361136f07c30aa1399240c8b98429d6979a267a1994"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.72/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e1da3472c52fed460aa10e3b9f045d396d925eabf5803dd8097f94e11a2c5227"
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
