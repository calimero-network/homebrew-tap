class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.1/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "77c98a7cb4c757c5f6a749468e93c1a74d63fd880ad14875b262d8363e73a45c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.1/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "3e2269cd442195c82d12256a24e3abf80d007bd962570e23fb730917d9a30a1b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "495f086448d0646f9929f596c5b94cf2401b9958b27788e982456458aad9da1a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bd6752b7807255eee8ef570d249199bdc1608399b12a80158f43662631d0af98"
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
