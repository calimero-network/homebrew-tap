class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.20"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.20/merod_aarch64-apple-darwin.tar.gz"
    sha256 "acdb5a7a41e65f10975279101471562d6c14338bd70cd7999a7f76c30bc74e74"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.20"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.20/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d39fc59b084b4a4073df20c3e75d9da5321be4284ba5d7cc21b37e7bed43f4da"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.20/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7dff8680328d1cf4388c07c7201e274cf4a7ba56ac93560252a276f807befa9c"
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
