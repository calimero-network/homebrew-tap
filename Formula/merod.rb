class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.17"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.17/merod_aarch64-apple-darwin.tar.gz"
    sha256 "a3f30e15e8e45f826e773e067cda91b117ff58fd55132b229eedc872e07e5dc3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.17"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.17/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4f023e1cd0bf7aa3b0290af55f821f582be48ad9f03c5226333025bb176a0e06"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.17/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "922563e8ad1fba18ecb9c1d778c6f2ab42e41f4c8f82905495f2b3a2d3c1bf6a"
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
