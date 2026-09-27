class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.51"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.51/merod_aarch64-apple-darwin.tar.gz"
    sha256 "64f3e53636bceee0d996e750159459a8bba19e5793534fb20153dcb2cf03baff"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.51"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.51/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5d3855c0ecbdd15ff62be22d085dc44ce31f779235b0a1e6c6dce83a9c734924"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.51/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "15b91290ea74b0ca375b790904c33292e697041132f301a9673ef6884d645870"
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
