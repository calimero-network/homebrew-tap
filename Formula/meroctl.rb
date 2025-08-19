class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.6/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "c3bd56fcb5832a6768fa6143e1774c870a60ccccc0ddb3b5e9a7887f0c721232"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.6/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "d2992f6aa82747ba3fc24961488b7e4523bf044396d37f881353d38751b0aa84"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.6/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e5b56f12df4a7032f21c6fdd8ae3861d178e3f628c0fd569f25c36f0150ec57c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.6/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5a09880f4b07a20dbb8dd919f95ac0baeb273aa5262a9f38d2bb2fc82590cf44"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "Meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
