class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.3.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/merod-0.3.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "18e5b875fbeb4abad088b2c6e3a741d8e9188b6376998a657c29aebf980d8407"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/merod-0.3.0/merod_x86_64-apple-darwin.tar.gz"
    sha256 "2dd2e284e13d9dba586cf9f7825e04b60687c8a7637ede2793e3c39eadfbe50e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/merod-0.3.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7c520fa7f063c7055ed94ea7ed0cb2634ee2907e7df0feb84cdb33d1f701323f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/merod-0.3.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9324b626502db409f1e9b270ad9bd9acb5d4a53f6743917c711b2022a198bc25"
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
