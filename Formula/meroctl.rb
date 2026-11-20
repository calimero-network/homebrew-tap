class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.32/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "a40a1c095008633b9d7788338f68a53b8b62461976c456459ef7a16555ac6bb8"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.32 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.32/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e783dc51f77c14d8bcb46d2e60b76f86d7ffec9a61ab9d289fb46423170018f5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.32/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6a77ca4f20262c4ec568baab2aa165d1639f9cb08400196840d6d1611f037b3c"
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
