class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.4/merod_aarch64-apple-darwin.tar.gz"
    sha256 "0566e77780359d9aca9018e85970890f7067e8dabc393f1a36b3cdfce83316a4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.4/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c402eeea17ec958730d7fc7381443533ba1ef48008247292dae4207bd2788832"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.4/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dca48b9513627b85d08e5874ad8a2b4305283b3c783be132764ab761a9bb7bd0"
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
