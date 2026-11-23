class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.35/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "951b6057a56e9c0afd612488000789c6055801f88dbcbe725c4b26462845ef22"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.35 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.35/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4eef5a5f20bbdc023d0e843814b9e70716fb2df1a077af68aae5e83c1d54fbce"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.35/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a19a3babf9bac11ab6ce43d0e60349ba4f9ea438934d3c1e379239226e1b71a0"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/meroctl --version")
  end
end
