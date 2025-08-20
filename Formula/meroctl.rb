class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.7/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "2b4654ac2cd78f10ccd51da999db6582af3cb7a7f98deab33c1f58e2fe58c991"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.7/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "d144249db0078a4cd1cfb645c6d7d1c9437dfe75eb85277a9ce058a36462dbce"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.7/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4c61723362cd9d385869a6b66774ae482e06aec7f122a12de082b12526039b27"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.7/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dc580c07482a7830c77a638f00f9241e96fd3eee969a713a72218fd1e4ee2d6a"
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
