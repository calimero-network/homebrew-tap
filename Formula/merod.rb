class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.1/merod_aarch64-apple-darwin.tar.gz"
    sha256 "78cd0a3999973a22a8b1fa927f2966efe8894a542c6702fb2921a86661b0de98"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.1/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c200a8e3b9cdb49a37d54157fe0654797142137e22d84ded4f2eb8a4856f18e9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.1/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f49ea7e4e7bda4d9645d818a77471064ce42173ede2a10f653b634594bb8bfa2"
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
