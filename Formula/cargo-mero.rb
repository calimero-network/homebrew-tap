class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.52"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.52/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "65ac802b81780295ac58c8e937e38ae35349d69fbbc5bb422fa194e1b099be16"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.52"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.52/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0d485bafe8ba635a0c7ac241128aaa18623c82451b0628e235585a37959f58c9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.52/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a2e6cae61b15163aa7ce577556ff1e0d2500537fc7b38ed7ff166bbc8932b1b1"
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
