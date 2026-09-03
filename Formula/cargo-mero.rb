class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.32/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "5c8828fd233f1dd3fbb11d6db482bb6aa4072b84f2351ad6728b67dbdadb5453"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.32"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.32/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4c352c4fbf77e9ac918de4fcdee44a9c2925343373fc5e433785f88b54decffa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.32/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "36621d99f84e03e9d20adb48dba84f0040a34cc3edca09b2c966f3cf811849f6"
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
