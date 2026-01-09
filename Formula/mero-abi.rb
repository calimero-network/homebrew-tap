class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "e5487d51621417e7890843e83a61be2afa0a402b31e6a4304ebcc584a3932f52"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b314de143d89d72cdcba068efe0bc701fa2e09272e97d119d4d91aa964ef2114"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7c44555895cf847a3197a1b52f1506dfb6142502d0a1ca85b156aef69ba91fec"
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
