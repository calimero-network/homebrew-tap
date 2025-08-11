class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.4/merod_aarch64-apple-darwin.tar.gz"
    sha256 "53ee0ad8e2097361f5cbabee4f71a374f96708d7ef92ab61577671e51e591d8d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.4/merod_x86_64-apple-darwin.tar.gz"
    sha256 "6fed8905832bd75759e0ba9236508ff49e11e6948340a78a4c1c5ae83776ef71"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.4/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d365ae182d43197296582002404433526ae824b11faf92a032cd7da92040c8bc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.4/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "db4b49f933eb90df66862753c67c775474dec5c8dd1aed86ea026d93e0cca862"
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
