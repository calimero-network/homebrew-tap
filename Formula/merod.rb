class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.26/merod_aarch64-apple-darwin.tar.gz"
    sha256 "69ecd3f9d155dfedcefbeb9e642c8b4120e9f5792894497dc75e70ab7e47bfbb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.26 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.26/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c15c197b05489cc871d4d3452fb5a2767aa73bf3ec9a4814f21865e4d4c9d897"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.26/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2ead307daeb2d98704c24a9354b3568113b3f1a3f330118e77b7238cfb4fbdc1"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/merod --version")
  end
end
