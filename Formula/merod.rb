class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.81"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.81/merod_aarch64-apple-darwin.tar.gz"
    sha256 "e9b6efe49c77aeeccdcc206f0421340e5809028cd8b8c20466347d8c684baf8f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.81"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.81/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9a0a2cbf4cc1e62e582e1a8c524ebceffca74291e949b729d9eeceb6b54e9b3c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.81/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "efb7e46cf0fe726a7281d4d89e42fa8d8f60f3e92ce03886b8c82a94285998be"
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
