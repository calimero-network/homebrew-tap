class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "585cb3a14168d2a2d0aee7827ca55454aa1ec8f9be298271e7871ac2116f2df1"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "9ae8c13d4c0eb0e4e202b835b04f4cc5b04f8a3f453d9902662919af2ee9146c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "790f85c972eafc402db194f3c4ec6ded4e6db0d0d320ebc56c7c5327252e5617"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "137be58dae6188dbf69c24b9e55ac8d1c0955e95f7a5cf169c8d2591986cd4b9"
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
