class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.16"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.16/merod_aarch64-apple-darwin.tar.gz"
    sha256 "b458b5521211b099f02b6aa60f6162b028682454a614193d03161ac6753a000f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.16/merod_x86_64-apple-darwin.tar.gz"
    sha256 "2fb81a3d472207e53a77069c78f293ccbbb3dc6d4b2c1bf017c08c8ee8982bf6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.16/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "082fcc756f4f8fb355416595e57f4f8e06b4d9f1bc63e68e863c234b2f5d0e6f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.16/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d10185eaa6036a163ee14a563f6b8ce684cd13854adf392da0a25f9c36e74bad"
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
