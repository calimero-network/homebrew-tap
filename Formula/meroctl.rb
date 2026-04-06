class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.18"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.18/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "d0daa24abeafb186035a7027873f4530d0bd314833cb191aa8c7e7722b466989"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.18"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.18/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c3bf57a64424c02e349671c64a10d6433d2613a344a48aad3f09835e9c510cb0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.18/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "910090e7dd4a8992199bb60342591ae2a985c500778ec17551cf46900b28a89d"
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
