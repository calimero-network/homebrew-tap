class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.44"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.44/merod_aarch64-apple-darwin.tar.gz"
    sha256 "40e8507ffdd0af89af60477eb163fd28f07363650cbf20921b4f6bdd8e12ff7f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.44/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "167bac477e28895a164261b56c83e07e7e22880610954423663d9998565f863f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.44/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9e7db9c09132633f143e520dbd2c616c352a2b3ae7463fbba181a4d69ca1e7d9"
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
