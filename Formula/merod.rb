class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.62"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.62/merod_aarch64-apple-darwin.tar.gz"
    sha256 "210956a74539fc3518ca44d33173432d10e9a804e7c30c374d0b53a4377ed778"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.62"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.62/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "78c4ff12c2022c22ba312436e5d933eb9e6a7187ec65012bd47d29792d7597e0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.62/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fbbbc49a8fe3939c50b1ddb9f4d2ce6bdeeef0b183e2e8f11604b2b5e60638e7"
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
