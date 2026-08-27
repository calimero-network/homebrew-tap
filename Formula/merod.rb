class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.26/merod_aarch64-apple-darwin.tar.gz"
    sha256 "30948862a735113f16e594d418ff32a711f965e75364159a24d9506e3490d12e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.26"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.26/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5b5d3980ae058344e052ad705ef791a07b96d4c14f97bf687eca2fa59d105eda"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.26/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "28f715d10384f63af8351dbd225c2747e096b1021d8213fd5b06d44d1a54ff2f"
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
