class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/merod_aarch64-apple-darwin.tar.gz"
    sha256 "d5ca4eb6958579db330a0d97011b54168c6bf2eb350ddcc315f8257719d3695c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/merod_x86_64-apple-darwin.tar.gz"
    sha256 "4562e54c5ce129e221f06f1843a5f7e38b8549651059b1e3d82e4ff664fbf75f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "84ff8900dd4d6648819f34429b54314daad120e9afa9ed3c170ea86cce4aa512"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4b00d05f8bd36b91570fdd893073363fa296f780488e45d808c6f88f3894f78b"
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
