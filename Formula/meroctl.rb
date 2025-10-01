class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.17"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.17/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "de1f2dfe1a4d12c7010fcd925af538abf7e13c7570af0706eeff3692d7325876"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.17/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "bb7a8df62d1e8ad90462e397720fdb373dff10c456d8375ccad555092939fccb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.17/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ac3dd1edbb7c710eea128aebbd0ca592c2d6ea50fe64152a1008387910677285"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.17/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a8207a8b4b820fa669bae75b643ecaf09d6d3b08e0a327a993f483b2296f70bb"
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
