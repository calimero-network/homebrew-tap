class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.2/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "c637dc628b97db9f28516fd20f4b0c828d775e7306379acc500977099ff714a2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.2/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "44f47484663c78b9cf6dd8d928783c57dd74a20251e43018a187315b2fabb381"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.2/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8e4a1e4be247b48dc31ffe4fcfb8dc1aa4e624ddff38910cada622c6af8cdaf6"
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
