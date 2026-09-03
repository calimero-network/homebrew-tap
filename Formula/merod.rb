class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.32/merod_aarch64-apple-darwin.tar.gz"
    sha256 "69ebd4fd8f8f46040922f3ac681e60067667bd2c910051cd208aa639c4d180b4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.32"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.32/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "22229bd12a7c6bcf282a289cf5e678a167192921aca0cfd6855fe441d9eec0d2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.32/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b50b5f45e46e536f0c4645781dcb082f7ac2cd5a480aeb0c844621a016d283f5"
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
