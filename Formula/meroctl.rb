class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.35/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "a9a2352126f25e7671d7339f266356a46f3373cd684d8f54fc14cba70dbdca4b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.35/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2d1a7d41ce270ca0113ce941534c7d892b74e3502907f8ad079aa14b8b841d2b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.35/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e15bb030fabbd05cf580e82661ce80086bdf6204945a625107fa5835a45627f6"
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
