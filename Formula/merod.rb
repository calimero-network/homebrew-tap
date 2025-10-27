class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.5/merod_aarch64-apple-darwin.tar.gz"
    sha256 "fa53714e1a2023ecf554ab6abbb09180d0780001e2318177f3cbfdfdba9a34f9"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.5/merod_x86_64-apple-darwin.tar.gz"
    sha256 "3a0840fc1984cbf6af039be9b995f395af910bb2583f351c5322fba0ee933cbd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.5/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f6f42a31b9eb580e7c6d2f677eaf785bf313f6d7298944f6ccf1da155bd2c9f6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.5/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cbf51aebada37463b048768d26662fc66a3affca352ccd3deb8c793e44bc472b"
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
