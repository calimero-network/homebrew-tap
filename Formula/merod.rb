class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "5af8d243b07656412a895322ed96a71e211627865183ad36901bac523317486d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0/merod_x86_64-apple-darwin.tar.gz"
    sha256 "ba166a3d76aaceeb25bcac88160b556154896bd870c52397eede9d586d6cb07e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "eb41a94a6484505cc088309bdec09e75fd0abdd87607553433b4da8305460d49"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cd9015705f81f9be19dfeafcaafa106ec5d3b1afc5a409c496d034e0ea64683f"
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
