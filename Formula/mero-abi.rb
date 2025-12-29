class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "99c55ff76b386a0a3d31d464a735ced921ec5feaf59d2612478e8db7b42bd8f1"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5834d0e89e07f405db2115c7797388739ed546b4d5fa2ea4c561951d7d7c9846"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "acba8768449e5b8a00b49103c7ff18514ed227f07bba25b0361fcfe502b7f1d6"
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
