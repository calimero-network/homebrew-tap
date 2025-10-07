class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b13d9211c3bef07b83953d678f00b57ee709ff5aabef5e6585691dced2c09f85"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "ff3da44e95daa61dfb369e9216425eb7ed8ea7dd9a6ca406d5275a258bdd19dd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "11c0ebf89bf1403069abe8204e75cddbafda3cb17d890fb7549b6e3f139aa083"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fc325e690749f2593172b27f5e3122864fad338465617e8935a69cafbf46cf81"
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
