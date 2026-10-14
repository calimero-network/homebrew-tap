class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.86"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.86/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "f5d81939a5821361846539cc2021dbe477e14b91db06f454a57f48fe8affcdff"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.86"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.86/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c866ddcd56931df006364af02de88e881aade9da850f7e5e43a6175bdcd193da"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.86/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e7dc4e046834b3b27a1590d3978bd90a83202a1fc31a45e3b9eec280e8b48ffc"
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
