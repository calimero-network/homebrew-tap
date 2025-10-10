class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.9.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.2/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "6e5527e95bfbc3fea0a512537747db3c713eeb3d8f46b511660aeb974a6c4481"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.2/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "7f9c8a436139cc8d83c5d2aa4330ac48370aeeeb421ba15ed85f685543597b6c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.2/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "55874de327076b61954b20c551be84854e4434bee8c6d0a2e0c11cb84c999608"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.2/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "075fb10d913e37da863b30786d00b2e8cbee6bcaa1b5067e9fb65f0b9f2732d6"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "Meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
