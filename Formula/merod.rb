class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.86"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.86/merod_aarch64-apple-darwin.tar.gz"
    sha256 "7f580cf9022a6c94ced4758ed649598153d2149a261ef23ae94d82e9fe41fcd5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.86"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.86/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "da38359b7aa41bd8986507158b152e32518d63db05cc43c2ce6aaa6c261c562f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.86/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3b29bb36d1f62ef5af6c72f1bfb36e779dfbf465cd497e2aa62f75c2870038d8"
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
