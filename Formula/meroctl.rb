class Meroctl < Formula
    desc "Command-line tool for Calimero Network"
    homepage "https://github.com/calimero-network/core"
    version "0.2.0"

    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/calimero-network/core/releases/download/meroctl-0.2.0/meroctl_aarch64-apple-darwin.tar.gz"
      sha256 "e6b1649e28cbc1e741ebd903ed6371e7a48ff491404dd4532ff3f5154d9f60b5"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/calimero-network/core/releases/download/meroctl-0.2.0/meroctl_x86_64-apple-darwin.tar.gz"
      sha256 "39debe38ab613cb055fe8b16af61a01655feb7dc5664e49d908f3e13689514b2"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/calimero-network/core/releases/download/meroctl-0.2.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff97d08c90b0fe405ad86dc17167dfa0339b8f7519a1c8d336e6709c433df8ad"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/calimero-network/core/releases/download/meroctl-0.2.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8f711384498fea5a30847a1984d1f910a5ab4972a97d946dfcac62d056a6183"
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
