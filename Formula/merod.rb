class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.28/merod_aarch64-apple-darwin.tar.gz"
    sha256 "519b2aa44edb54fe12f6d9af09e24ceac40d2315bc3e4bc7caa5fa59869f1d0f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.28 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.28/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6a816408915c56d49b2874617bc5083051584e0dea000a45ba974280bce870f2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.28/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "550ba6bb2ba3c19753c886fb2486bb09bc45de21ee089b482a16f4c4a04f6f7b"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/merod --version")
  end
end
