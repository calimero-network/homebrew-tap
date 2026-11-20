class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.33/merod_aarch64-apple-darwin.tar.gz"
    sha256 "fea40989dd83e669f2f27262ee8cb9de8087853d82a3ee16ebb0c3dbadbf4bc0"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.33 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.33/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a595ee8337d9b916d3b2908fdefb9ca7c8248c40a54f07d0605b1a37dda9c758"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.33/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "003fb762f8350e312f4987ea5dcc6b00e758bfb7fb4b569d9e3a68c11edc98c6"
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
