class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.9.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.2/merod_aarch64-apple-darwin.tar.gz"
    sha256 "18720ed085d1a9f1a9fa38364c828c77af791b00e8ecaf021115bf343dc4247f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.2/merod_x86_64-apple-darwin.tar.gz"
    sha256 "a0f90ae102c0a606074219c1ad53c04c150ebc1456a62ddb0c19b7f11837b868"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.2/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a7b927895b0fef1a4af65fada3585e2d2349bdd437ee8793483debda68efbe36"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.2/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "34da33a727fe3b6cc9f2659de5a23153c2bf327eff1245f295519c55ce723a05"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match "Merod CLI", shell_output("#{bin}/merod --help")
  end
end
