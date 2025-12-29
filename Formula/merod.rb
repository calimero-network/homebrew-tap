class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/merod_aarch64-apple-darwin.tar.gz"
    sha256 "312e4d3101528d52959464190cc073a94088d2d3b99c6d90c3e7339be89bd89f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "411682fe4e74cc1fe2bf0f515586a8a7b955dfc89f81493f6177870045c385a3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b73f2536059a5e23a9e01bffcb85226455f8e63acee5fb6847bff87c09e93a88"
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
