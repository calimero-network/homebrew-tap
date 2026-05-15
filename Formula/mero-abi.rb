class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.38"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.38/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "36637c4dea2e74ff95634f97ec3182803e65127310f3dc668e88e08509dae1f5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.38/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1ec262c2576bcb19d53f47962bfdaf3441ac7fb75a9cfbd2d610abf213677ec7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.38/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f6c88dfc797b1058523faaffded97dfd37d8c9428f29dc5856147847d29b730d"
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
