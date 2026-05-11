class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.37"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.37/merod_aarch64-apple-darwin.tar.gz"
    sha256 "88ed240fc31c820e819b6348f0c4fcb18f41e968dbeda12a35584d2ba96cdc9d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.37"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.37/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dd2aec4b333f6e46462cf9db6494b556ad0e0d0b31fe608c6dedd638a0f44a00"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.37/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8fe9e6a52f414edab1300855584af61746f8e54b23db973ad5f5f3217cc2bb91"
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
