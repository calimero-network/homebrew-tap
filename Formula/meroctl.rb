class Meroctl < Formula
    desc "Command-line tool for Calimero Network"
    homepage "https://github.com/calimero-network/core"
    version "0.1.1"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/calimero-network/core/releases/download/v0.1.1/meroctl_aarch64-apple-darwin.tar.gz"
      sha256 "4b570bdb3775cc29131a9fcd8f0c8ac5ea04d9ef03aef2c3b120af77783b8d0b"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/calimero-network/core/releases/download/v0.1.1/meroctl_x86_64-apple-darwin.tar.gz"
      sha256 "d9d50d33bb637dd871dc7fe8dbbff54f4a4d8e40c08d0e84a6717e5eb3bc0313"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/calimero-network/core/releases/download/v0.1.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9d50d33bb637dd871dc7fe8dbbff54f4a4d8e40c08d0e84a6717e5eb3bc0313"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/calimero-network/core/releases/download/v0.1.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d98c65a0c1a38f46debbe8265702ad084a2442fda739d73a52f385b9139eaad"
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
  