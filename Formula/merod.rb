class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.41"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/merod_aarch64-apple-darwin.tar.gz"
    sha256 "a75baa94a0e5507b09753899936a7f3d8e49174b0862287697d25a243d3d5f1c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9923bb57245c8aee3962ca9d6c1ef1b1078044fb756294006f0c8c3af36436a5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d42cbee8d80e0ebe80ec23324eca1649f6d4f2ba74cb2981d14b062039320dac"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match "Merod CLI", shell_output("#{bin}/merod --help")
  end
end
