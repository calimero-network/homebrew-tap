class Meroctl < Formula
    desc "Command-line tool for Calimero Network"
    homepage "https://github.com/calimero-network/core"
    version "0.1.1"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/calimero-network/core/releases/download/v0.1.1/meroctl_aarch64-apple-darwin.tar.gz"
      sha256 "7eac165f59473a7476fa08b26f9f9d1ae0f8dac1b9680fcfdd2903b55c3f8f0b"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/calimero-network/core/releases/download/v0.1.1/meroctl_x86_64-apple-darwin.tar.gz"
      sha256 "2dffb5c0d42c56ade21e17a627101e3313fec0a2ab8e04ecded2323bc54c0f8c"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/calimero-network/core/releases/download/v0.1.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5fdb84fb04dafc9cd1c64a538b56dc999643670c49494abff809ae2cc33f40e"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/calimero-network/core/releases/download/v0.1.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d9490dcf722761d1400d7f05cffa80606c533491b2071f6fd66037fafd1ec47"
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
  