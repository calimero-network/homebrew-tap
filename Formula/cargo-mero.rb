class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.73"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.73/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "c20c739f95e6fcae4283d4f7c3e3fd26abb52291d1fa9a290da19ffa49975566"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.73"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.73/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e5f10b2465fd1012c99b8e108c3482c8a298656c9cacfac73f692a1e2b9e00a3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.73/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9afc6e7275b2acb47e0204aa54d91306b52fafa940a3a85a626c361b068de3a2"
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
