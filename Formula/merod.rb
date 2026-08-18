class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.23/merod_aarch64-apple-darwin.tar.gz"
    sha256 "f8bbcbdbf1b65b825a786b3f7c2ef4cafdecd9d661cdc28c184a96724f005388"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.23"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.23/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3a923610394ef834822d75969fb5e398903744c94d43bb2d11b11d1d47e8dbe7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.23/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8675d423328cad4db1316c7b14f267b26dcbc43684a39c889e894bba0c23aa63"
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
