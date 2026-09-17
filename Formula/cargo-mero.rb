class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.39"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.39/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "c077fb866476d24501f3618a03ba6602d9bc870cd5607dc5c831790394c6159b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.39"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.39/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7db169906c68b1be394ac25fc161bdbd92d0d61e99b1a7563795e4a1b31ac26a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.39/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "581f6c620b02c9d8f9747948cf9a4702406a45756cb2f86f4edaef77bd64dac3"
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
