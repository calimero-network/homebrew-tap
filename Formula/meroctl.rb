class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.29/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "17d976e36fed48a4059f12122dae0b16cc13bfba5e82f7b31ce900e3717e6a10"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.29"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.29/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "eb6f4d0ab17a9a1c5aaaa18bb5baeaa7a5c1412c6208a91f12d52a5bf6e27c8a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.29/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0a91a4f24550cecb6d62f97f576d52d95363fef2205057b918db0a50a775bb5b"
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
