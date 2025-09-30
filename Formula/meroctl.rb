class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.15"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.15/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "1777b8a48926d5b0c6bb0794dc1e1c0f7faee59fc4141073550c89cefaec2c1f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.15/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "64c7e2a4f6f00d58266f32f74e64c3b7ecbcd674a9bad4e199821d820fc5eb62"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.15/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1cf6ca3689d819ed999312a1178dd24f8e11ddad28289b2f4669161746555e21"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.15/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0fa3c8eac48a1301d38fbd13602ee029cd6f837797dc0e39e84786adc70994da"
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
