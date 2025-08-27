class CalimeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.9/calimero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "ef1d22894a592e7f66f72cd07346a10dac082a4983c3c5d72edab43b24a57dc6"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.9/calimero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "7de67655be399154b327170ff960ebd4989c4a23a3d5290cd000342dafd59f66"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.9/calimero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "822dd60e4acb539cf0c981c291bf0547f63f365c6051665467148c6942d4ca9e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.9/calimero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e2dbd1c478bb99b7db89b605126aa065bcb736876962c11dbb945467921846d1"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "calimero-abi"
  end

  test do
    assert_match "CalimeroAbi CLI", shell_output("#{bin}/calimero-abi --help")
  end
end
