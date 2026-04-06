class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.18"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.18/merod_aarch64-apple-darwin.tar.gz"
    sha256 "134a94297f6c270c1d320ccef12f9946ac8af428714e4b00dea28c5d7b37ab10"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.18"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.18/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d109942bd998bc89728d341f5821f4f789a941c8cb2c237c6fadd16a9b65ea72"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.18/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "824d90937500dee30fe8c4f46399940d28b548f702f4d4afeb6a9f58c0087145"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match "Merod CLI", shell_output("#{bin}/merod --help")
  end
end
