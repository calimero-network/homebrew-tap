class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.24/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b8d6193ecd5098798af47a25ccd25c16571abe9433ad7ca4b5cf5a170db78fba"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.24 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.24/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9cbdebfb2d84905c45d39e85e282e52cf35871e3a84077b66076a5804bd11dea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.24/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f362bd9c2b4eea6af75ffb8b6a7e19323e38a061105b041c07aa666b1e45c2f2"
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
