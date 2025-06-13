class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.7.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.7.0/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "4a59bcc7ee7813cf944e87b2651a0511d0e82c55b5cb706341650bab24a57e73"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.7.0/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "89ea27e609dc1dd5c61d910317e1ebacf0e2098e544381ab995cb421e9d0f987"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.7.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "eb77198368de164c7546763722d945d37850c8f09d49e4677bd082cccbb29aa4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.7.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8ac99cd6a8e615738cc8a5e62fb9dd42e1274121d032446adbf30a346ec5cdc7"
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
