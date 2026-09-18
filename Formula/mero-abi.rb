class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.40"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.40/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "a023256705cee5d55131f4acdcd41011e9ad28a9adb5e557ac8039982e789a0e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.40"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.40/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "77bac7bdc8c43dbbb72bc4924816fe82cfc99f25afd204d3fdf225b4c3715c3a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.40/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ac9556dad09ad79230bd1a3c3c4fdddcfe31877456166f1644fdb684cd567c05"
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
