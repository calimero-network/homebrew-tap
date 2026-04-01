class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.16"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.16/merod_aarch64-apple-darwin.tar.gz"
    sha256 "434c98f58473b6056fbdbd6a8158aad9f26dbf6be1666573ec774fef1b6879b8"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.16"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.16/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "661a5c1886fceb11d09a5c2c0df5b1bc4e4b648d9370ed899e5c5349ff1b5065"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.16/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "23321d245600679a8877d40bb9991bdce04c8aa2be7f13575fe8d1a1ffc8dea6"
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
