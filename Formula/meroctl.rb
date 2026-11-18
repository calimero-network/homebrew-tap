class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.31/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "2d3fc0f0b4100164aa67f78b5ddcd5702ae373e0a4a595e0d45bed38378192c5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.31 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.31/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fb8ca588ec48ed2e21dae4ccda60306b755951e004e2b613276282145f8c7b41"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.31/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5a19b7fc54628ebf2e6bc6ae153c153708d304cb73d517ca781b3b5adcd523fc"
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
