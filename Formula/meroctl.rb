class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.78"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.78/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "6ecfca493cc07587678e42e3576c95f8be2f5a875388feec1b8f19c853f2ff03"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.78"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.78/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c18ad07d81a04fde87a7b8ce23060903bb2fbbdeb0bab813e918d9a719857fda"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.78/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b028978bf5a3c8df8ccee3efcc80d35e16ebc0ad992a0d0e18e9e3a8cc3357b8"
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
