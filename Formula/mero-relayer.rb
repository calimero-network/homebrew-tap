class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.41"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "14add197ce9f2ec8850f1c904a14cb1b86f1ee893dfed48b9033d650d079af93"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0599a81ce3b8a5089bcc5e3b75ddb70c86e5790bfd8e62bce468b8f59e5f2941"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "59522ca2f5eebef80c0ebdd3b6ab72e3e8edce6f6bef385f29d5f435bb6774ae"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-relayer"
  end

  test do
    assert_match "MeroRelayer CLI", shell_output("#{bin}/mero-relayer --help")
  end
end
