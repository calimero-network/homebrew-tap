class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.13"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.13/merod_aarch64-apple-darwin.tar.gz"
    sha256 "e310a2021f15b0baaeedd39cfb1e329a7aac8ce053c81e5af4cf51a32c4779fa"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.13"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.13/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "22b4395eb66e7b8ca34f4a096cc16066e7753c67f8eb2142b5deac8efc0cbf36"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.13/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c74cd18c3ccde01871de65ed719dde790fc173e55452859f9a3e5ac5dd13321e"
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
