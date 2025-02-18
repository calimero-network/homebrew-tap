class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "363bda3d1e9774140fc26a4453207fbcca52d3ed949c976baec60316b51eff9e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "9510c34dfae5186755201360f92ee99b5ed28e52fc9bb743480cab5024208034"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0a913878fc537fa4c83d372d20db250050d02708d4a30a3771d55f89a921b944"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4fedeb99434c85752d0bc080599268ac1bd6917c164be110fdc620b4207533f9"
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
