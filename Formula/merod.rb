class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.80"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.80/merod_aarch64-apple-darwin.tar.gz"
    sha256 "59a9c91155d192f0a3075599b57ed9acdf3636a06baeeb7c9d64cbefcbda4f21"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.80"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.80/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "35fc84101f1576945e3a3976eefee4aafe8c81ab339e76aeff970590246e9d72"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.80/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "40ecfcddbef5950d7473de4c59951294f134cea0f331ef71cd32c7474b8b79a7"
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
