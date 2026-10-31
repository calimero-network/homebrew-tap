class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.5/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "3e34e85763fe496de1c87e19fdb304471af5d3f4e15ffda8994df1c9f1e31254"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.5/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e998378d8ce3296b1360090622d3ec5b9058fd744e3ced60d30e558a5a597238"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.5/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a71f5216e66e070eb70253aa1546ee9a9bff32537f90e56256b4b68b537814dc"
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
