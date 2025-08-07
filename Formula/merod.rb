class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.2/merod_aarch64-apple-darwin.tar.gz"
    sha256 "5b2e7b3d2c6b8d262b4b81ff42a01baa2085870733c4e2babab01ab52fa7022a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.2/merod_x86_64-apple-darwin.tar.gz"
    sha256 "036e82d6626d6bb176e03efc81f58856d3e66b08817a158aa0b82429a4127813"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.2/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "958966a6b420d146854eb5ee9ecb331c8d7151c4bfcb952c1fd9358a8f82646a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.2/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0237ad0508f4b6898006dd08f0a69ebe7972a034fa622605409e6a72a286ccdd"
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
