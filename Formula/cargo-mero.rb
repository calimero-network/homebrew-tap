class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.53"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.53/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "10e3e13a4fa99163e9b80b15513498b09bb211e565c45156a6b9ce3ca5afefeb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.53"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.53/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "42bf158854648bb8c15a12e936830e72820503d28b55aa904297f52d41cc2554"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.53/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7d943e9c4ab7c2767e217ee7413aab09d4cd3e98546fd7198458af779f88f7a2"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "cargo-mero"
  end

  test do
    assert_match "CargoMero CLI", shell_output("#{bin}/cargo-mero --help")
  end
end
