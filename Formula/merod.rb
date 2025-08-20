class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.7/merod_aarch64-apple-darwin.tar.gz"
    sha256 "706a3a5f97fc17a7b486ff4c2870e6f72b90cbe916f28a88a613fff444dd4b73"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.7/merod_x86_64-apple-darwin.tar.gz"
    sha256 "8878dd5b90ceb190390ed54493d6ce56bd755856df8c45e9663f10358812e06a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.7/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0f1f548dcc4fa4845e6ef3a731cc922ddeeece1696a41aaf8c4c23e66bd0d99b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.7/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5e4a463359259c21cdcf19f0c968a0cc553109e487b02323a42afc0eda17e43c"
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
