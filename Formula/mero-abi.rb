class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.9.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.1/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "0579edf0431a4dcfd8d73c4094c43bbcce7c97a71a456062ef9bf8346168b77b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.1/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "2f0b3c1ffa6515d928248cbfc5d3b56adcf1220a11be4e619ac0c27215443f52"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.1/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1a7a9257e9164972ba91ff3a8d70bc683f292c32eab8ef97938546be1a06dc5d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.1/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f43894e9c185d208f7571fd67935210723d8879ae6626d60cb2a51c7e71cd96c"
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
