class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.46"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.46/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "54d41f120b066b98175eada0f9ee49ca1c14d4bed0c19a1f0541668cc17ee434"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.46"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.46/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "52f2bd4fef83d9835362c77309199812821ab50d06833023b714bc4cfd56ee01"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.46/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5d9b17484fb58c36f1c02a6bbf2446732494cfe577c001afd03fb6b6f0e296cc"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-abi"
  end

  test do
    assert_match "MeroAbi CLI", shell_output("#{bin}/mero-abi --help")
  end
end
