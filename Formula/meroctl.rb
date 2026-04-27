class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.32/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "2b53cb55e77b3456616d27d1f972649747837ba66e2753235f9b2a1c70f0e332"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.32"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.32/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "372b4adfddbfddd65bf40b24fdb4fe520c5dd3bf4123efbf5427bf0c31928ad7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.32/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0fbb94fbc8d171d0d11f92d3397c11d1cb0a56d4e6d4755fb5eb30fa67f7b9f6"
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
