class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.22/merod_aarch64-apple-darwin.tar.gz"
    sha256 "fb699b62c22f309af1e710864ceb5b670805972f9c9929eb4de45ec23e26de1d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.22"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.22/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7367334d47b2871238df9e79a4bb292a836f8f7ba50967b035f313921b4bae63"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.22/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2e37cd8261e08518fa641e344f71df3b381a3d0ee76f4f9e69ea234f6c17e477"
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
