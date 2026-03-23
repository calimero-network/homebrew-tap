class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.7/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "1c3a19b2a20067ce3f6a3adac851bf7eb4fc90a7ff702badc921ad93d61ed96d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.7/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4d3a1740acf2aac79ac03bf03c56335a54e134b64e68038dd2be187e432a7615"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.7/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c8a1fcfc942e7f6188667b75088b603631ba5577722f3cb7fba6f987b94dc96c"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-relayer"
  end

  test do
    assert_match "MeroRelayer CLI", shell_output("#{bin}/mero-relayer --help")
  end
end
