class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/merod_aarch64-apple-darwin.tar.gz"
    sha256 "e4126a2eef30aea065ab0eb384ab1e0c81e7143c68032491962b395b1310961f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "331da2ca05de0560aaf70cd4f063f86d6037c3c1fa19eb8690f9c749d9124e02"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "09bbe26b75e555f9d972ebe2d5b1a66ed3cfd9a3c69cb76c706f20dade6aeef0"
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
