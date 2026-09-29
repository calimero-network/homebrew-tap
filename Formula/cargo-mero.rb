class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.61"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.61/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "b3406dd330c425893579c87b7115650b17343257bd2d4aaa20a391e7ac62fc0a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.61"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.61/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ea78a06f2dbf320823fc35cad767cc32d7cf09477787e78d216d77813d097207"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.61/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2b07e86c9b0c81461b5ca4d9258158554cf1af52eb5ff6472a591368a6aca8e1"
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
