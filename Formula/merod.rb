class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.63"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.63/merod_aarch64-apple-darwin.tar.gz"
    sha256 "4c10fff413e441bfe0e228fd1a9d77f5d0c24c8ef1f906c6283447c33dbe67af"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.63"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.63/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3e81e10de8b0e992b756729718e0cf90992bf739dcdd5d1ce6828f86c0aadd6f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.63/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fcddc82cf07fcc81c35c223e857b394510becfc84115257ba83affb49afe9927"
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
