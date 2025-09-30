class CargoMero < Formula
  desc "Cargo subcommand for Calimero Network tooling"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.13"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "6d2701e42fe0f364b3d8383ae3a7a96da66df91c4b7949ecb9a9b22ccf50714b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/cargo-mero_x86_64-apple-darwin.tar.gz"
    sha256 "36e44af1a9a9694c91911cdba91f77b91d7bed84d54057be1741df809decf087"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "89db8a2a5eabed41b9c6fbf091b37823ac37d1429419476b840dddacbe7f022a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b46a5ec7020f1f552ced5d3750ef782293c5231d34dff2a554ae56be4f853fb9"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "cargo-mero"
  end

  test do
    assert_match "CargoMero CLI", shell_output("#{bin}/cargo-mero --help")
  end
end
