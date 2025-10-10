class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.9.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.3/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "19568566aa035dfae6ea977c3df4da330748af8bbd55cc930613096fc04f8e16"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.3/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "562c89b830f12762bbd9f8c27a356c468906d350cc3aafa0f6bb16d6060d96bb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.3/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "afbfa4687a1199abb081be5bf3f52cebee929e39d898beea29903d98242c6089"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.3/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a79669ab81ef8a8b84bab402878a14999af758dc0b0a49e73e71b92c1ca329aa"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "Meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
