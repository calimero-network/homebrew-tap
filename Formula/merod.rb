class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.5/merod_aarch64-apple-darwin.tar.gz"
    sha256 "2cdc3d0b821537176313897943f959d7a0def417286a16ee3c6ef1ef91f6da77"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.5/merod_x86_64-apple-darwin.tar.gz"
    sha256 "aceb0eadd545a27121fe77cfd77c6e05949f97c82100b2b33ff6336a74ffa958"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.5/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2c6da26768358d6f8eb47886d511b11fa238a3289d3e5f43d84ad9765f268147"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.5/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b821a40eb7b99707484f30e6603a3eb0c518fb368658f65c030572c7222f192a"
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
