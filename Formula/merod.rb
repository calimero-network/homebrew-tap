class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.55"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.55/merod_aarch64-apple-darwin.tar.gz"
    sha256 "40df6cc1a0d7b1e383093bbf13be1840afd30406d3f477924c0cdbf096465084"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.55"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.55/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dca545e4627abceb5bc96370d064ad0c0bd6ff1b556de9cf252bf9d51d203712"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.55/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "685e973b325053183dd09cb7fedf2e768bfc0054b377530ab59161cf79363953"
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
