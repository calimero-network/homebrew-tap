class Merod < Formula
    desc "Command-line tool for Calimero Network setup"
    homepage "https://github.com/calimero-network/core"

    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/calimero-network/core/releases/download/merod-0.2.1/merod_aarch64-apple-darwin.tar.gz"
      sha256 "494090268ad73126ea7a5a8c62dd676befb874e2a568476f259c2f4cb67b3bb2"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/calimero-network/core/releases/download/merod-0.2.1/merod_x86_64-apple-darwin.tar.gz"
      sha256 "2decbeeaed0ecdf1882d4ad9998277047cf5d136450e8d03adbd3198fb8e84a7"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/calimero-network/core/releases/download/merod-0.2.1/merod_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ba62583d027c99a2a089e4a737e98145b54648803b0c38f7a07eca741837522"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/calimero-network/core/releases/download/merod-0.2.1/merod_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe34f68ecdd16dbbc692d3d2c3b7ce8cc4ff7d915d3847ad1992b1ab75efdde7"
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
