class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "f7d9c95b7b85b2f481d6b4b7ef721db60e3ae778f6dd93d27d27c053bd107c5c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "277ed7a52004afd5b41a8887dcbe44480d7a78b1581ad14c7e27f7430c245788"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "32b3c2a8c73731a338106c871d515a05a92c3fd53831949b1beba47f47d9a87c"
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
