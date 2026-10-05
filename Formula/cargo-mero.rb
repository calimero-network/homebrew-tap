class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.82"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.82/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "e3e60c5647e5987293bfb85d0463df1837326d1d531a109937d225d8fcd6668d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.82/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fa6caa336d943127bc35efeb8e7ae91131ed488c356b66bcf92c4e701dd61806"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.82/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2382c02987b3980114874e9857c37b648db506e8ca43feb556bece579577e80f"
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
