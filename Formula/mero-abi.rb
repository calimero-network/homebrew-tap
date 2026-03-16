class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.6/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "91a9997552cccfd3ad88fadb84884b4a7c25730b98cea7917be3142af9dbb259"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.6/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9ecb154587509a969d620f5c9a3d80ce45cc80759c92679f89b99efafcdd1624"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.6/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "81569b63de83c6ae16a936094137081d67300a7f6cb68fe9cd0f9157d2775049"
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
