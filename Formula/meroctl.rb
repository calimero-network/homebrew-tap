class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.23/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "4d2872231e3db6458f54e273798f0af0c7c69409b134d1f221982efed36b6935"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.23"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.23/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d5415c54e0312ff117ef6d83d915bfd58e68bcf7cf24067fa2a6046b3bc1927e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.23/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e69520646a2d17c8c7c9f3c01af14f148fe00ea544af31d281f140638b9aae37"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "Meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
