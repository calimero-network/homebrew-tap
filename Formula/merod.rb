class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.48"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.48/merod_aarch64-apple-darwin.tar.gz"
    sha256 "ed552b739d3df711f8c44ff92d5df70df92a903f63e8e9c07470f598dd68ac3d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.48"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.48/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "221b98af644ac7153520c6b49cc7a85bcc874061ebc5aaf01c18eb19a660e7a0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.48/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ad8fa95b9e8c2242c714f77219f610e0f511708aaabda6cd03e1a0134584ef50"
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
