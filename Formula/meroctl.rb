class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "ae8960ba05530436026397b8b2d5d092332d43999d6b0f6ea892952de0398586"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ea9c230502df69942e95a4c92be0b9ac763e095c0e6e0c9418bfb26186d5ad60"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ade90f600043d390a368dca7d1f906d716721be3a229681f7b0c69b183cbdc86"
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
