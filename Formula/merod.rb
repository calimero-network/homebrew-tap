class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.6/merod_aarch64-apple-darwin.tar.gz"
    sha256 "cb20312b13f81edde832e9dbb2097c31a9b99d83eca00886ecdfd1fcde53bc76"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.6/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1e2989650d30603e2e8e94f7583b4d567389ba872046cf29a278ecd31ce71c08"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.6/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1a69f0cb9dbe9bbe356dcc13c6b9bf6b4adbaa114d3314c6162a3c23d53184a2"
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
