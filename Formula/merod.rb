class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.17"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.17/merod_aarch64-apple-darwin.tar.gz"
    sha256 "a0e10ff5f4b6c96f692574df6e1f5342543bdb61b73189115eebf7cdc69ef201"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.17/merod_x86_64-apple-darwin.tar.gz"
    sha256 "a65f2b268c8fca2ae937be25c3d9e56a7c66ef935636fe709353c7c2a4006043"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.17/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5bae402b0baf5f85956ec1de74e56f55b02fbaf19cd1c84b0f11597ac11af9f6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.17/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e792506573bba710ad9c0432fc113f4f778a2edb3d8eb49b787b27dccdddd013"
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
