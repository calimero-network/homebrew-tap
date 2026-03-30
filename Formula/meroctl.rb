class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.9/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "fba97413f873bc0b658b3e32e4f342bbffd07369697257e8c0a5994f39b5ee4d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.9/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "11127a0f9844c4eef76e7a35bda575d6f81135769efb4d64ea30bc64fd23d9c0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.9/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7983f43c1126ce77eca566f751d70687dc92d4ae020ef5816b900b242af8a3e1"
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
