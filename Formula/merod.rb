class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.32/merod_aarch64-apple-darwin.tar.gz"
    sha256 "7f9d7f9e4fc95c34af90ffc8712e6fd9b0f462051ed5d5de9e8e8bf15d2ae7ce"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.32 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.32/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "861a04553d57242b4a8c61e07673407cd530edaedb2cb353f189815d5daa8b46"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.32/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9be5a2fad54a59b57ee45d0eddcab73fcb3f0013feaab9c22bc56320a159c427"
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
