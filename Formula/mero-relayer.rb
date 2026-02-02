class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.39"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "9481e5455bcac1a6d95ccb9729c8f98d1b58e7ed59add97c6e77d98558c5d8f7"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "23a24674653de43bae19c488c68d79027ff7fc27ff935cbeafd40357cab44a3c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cc6338631b08338c2fe19e08ddc6f248a1ae086683820a0aadf0f8eb967bde34"
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
