class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.25/merod_aarch64-apple-darwin.tar.gz"
    sha256 "25ceac1d405748e80d687c1d0fb151d1718035f8b4e807ea097bfebc30f22298"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.25"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.25/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2d86dbf45d207d807420d4464ea8eefde36eb31f012fc80863699a226aea1a0c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.25/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "87bce1657e5be912a1dfcef659c2eaa1e3957dab95270ab916b0c9bfac4849f4"
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
