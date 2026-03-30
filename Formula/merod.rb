class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.11/merod_aarch64-apple-darwin.tar.gz"
    sha256 "50c1d6f0ddb323cd52f25a435b33372930ee5da04050b109b589d63243bd97fa"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.11"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.11/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a0c0a5946761d1b286d1a995fef897d65105e0ab05b9462f15d0fd15246d3496"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.11/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "510a883eccf36bdf6e8ef3ac0acb2049a5e8ebd711bd869ceeef711d91f19687"
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
