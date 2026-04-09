class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.22/merod_aarch64-apple-darwin.tar.gz"
    sha256 "914267251fbf3fe5a8b37427794b5b4e3bb005237b66ac68aa029a1a6c83f6da"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.22"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.22/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f76ddc2658b8325e7267d90387209303839edfe64aa1c93bf58c8eb4b8d36b9d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.22/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "966563fc6b30faddb309c5ba1c0ee89d4d30761faa72c2b9fb2b32bb8b44ef01"
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
