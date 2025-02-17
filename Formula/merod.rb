class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/merod-0.3.1/merod_aarch64-apple-darwin.tar.gz"
    sha256 "6d4cca5814ced25b4988f222070546e8e04a8018ba86612961bbf9b294d6e296"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/merod-0.3.1/merod_x86_64-apple-darwin.tar.gz"
    sha256 "713e023fc612c0f74610da36c5d7c82389879d1ae79dd153c5181a9b5b5d6b42"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/merod-0.3.1/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "76987d93d4d2dbe98244be3ccb2f9cd2b08067b6f786d81363b68c0ad41fdb96"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/merod-0.3.1/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a7ae90a1d6adcad136e7b5683e364d05f33f2caac1cedf34e6216947495d7a2f"
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
