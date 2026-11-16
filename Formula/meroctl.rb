class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.30/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b3ecff621491e945936d983c7aaf73330e5d95857a7f45f375f18361daf33be5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.30 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.30/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "133fbf8759a615577fb72866e034bcc063f92181ff038234fb26cb8ec59432be"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.30/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "92c290402de3fd75c13562c68b19ee43bc4751b604add2fc3b75070b0d7955ea"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/meroctl --version")
  end
end
