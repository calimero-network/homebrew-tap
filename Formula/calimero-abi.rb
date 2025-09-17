class CalimeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.10/calimero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "e72dd9d092db3434ff511150bd79e309497af62729188df0d43bb515f7f178cd"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.10/calimero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "308523489030d5424225cf44824d18371c581d67d9f0ba3694935a4038c080cf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.10/calimero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ed933ddcf851851a3767ecab0ecc2fde79be879176ef1f0bcd6afaf9197f67a9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.10/calimero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "34c412f0d63afea76311c4ef2a9b5647584f32f0e7118e12dbc40e2edf123f28"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "calimero-abi"
  end

  test do
    assert_match "CalimeroAbi CLI", shell_output("#{bin}/calimero-abi --help")
  end
end
