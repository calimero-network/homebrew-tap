class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.50"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.50/merod_aarch64-apple-darwin.tar.gz"
    sha256 "f0327c2312c98936abe182b28f8801fe1387596df838c2106a626a83ff4f155c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.50/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ab260e7419e0ca6b61859252e3f2b6fe66697a61765c49a90d1c9575e5881dc0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.50/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "26e135b3f738fa8f69c092bc3554d4acc50abc6427ee42e5c6cd94946bbbee68"
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
