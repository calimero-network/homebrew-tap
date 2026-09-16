class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.38"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.38/merod_aarch64-apple-darwin.tar.gz"
    sha256 "76042d9daed00af58cf5a9daa1986e895f729b1a98ca11b2efba890750274c5d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.38/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e67fe122899657545d1877cc727b7b91e181c2b359da72184867a944f070812b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.38/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "56d1376ed0c5b776da834b09ad8fa3117e627df35fe1a563979bfbf6cdfeb6d2"
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
