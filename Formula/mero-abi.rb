class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.9/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "a420e644fd3ae10c9f9a6b82e925e30f7756ddcd9a92abbde684b8f2dc79d478"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.9/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "123147619bf8171f2f7319709bdc9d070921a39ca47af46543503b802ec2d453"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.9/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "17bc7a5696a65894c804963fe120bef07b0327bfe9991f4caca5d94b636f2fba"
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
