class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.77"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.77/merod_aarch64-apple-darwin.tar.gz"
    sha256 "118b17ecd60c7e34a1f34487b8c72fdccf04d5d00e3c1238e7a065ded69040ff"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.77"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.77/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "817b024490ba3cb96d53a14179e0bd10f5f80dbdaac5d1dbe063e3e4f35cc513"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.77/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ae5f96c3324828cd9fd9735db50df5c7df4a2ac62fc29491e802490cef4a4054"
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
