class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.37"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.37/merod_aarch64-apple-darwin.tar.gz"
    sha256 "8960b8eeb66948905e6bc3396b64fe793e03907aadd54867a210c991a45c6860"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.37 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.37/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2b483dbcb5b62fd531d3b5aaf99f38d1eaabaa7fb512591b024aa7913c1824f7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.37/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "02e1dae939100aaf0a390985d8937c15ba0853206cf57d7be0fbf8369138096d"
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
