class Majortom < Formula
  desc "Major Tom — AI agent orchestration CLI"
  homepage "https://gomajortom.com"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gomajortom/groundcontrol/releases/download/v#{version}/majortom-darwin-arm64-v#{version}.tar.gz"
      sha256 "ae18057a71ae333b3a6490512c89ceb7db04a18b5b17120b103dac131d24f587"
    else
      url "https://github.com/gomajortom/groundcontrol/releases/download/v#{version}/majortom-darwin-x64-v#{version}.tar.gz"
      sha256 "6232ab23c82060529eb918bcd71af0bb1712553f40ef3108003e418fbb093b40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gomajortom/groundcontrol/releases/download/v#{version}/majortom-linux-arm64-v#{version}.tar.gz"
      sha256 "9d7f2be02f44db2acb67c5ca0d00d4be6752e94c588f0e7f7414e3cfc70fbdcc"
    else
      url "https://github.com/gomajortom/groundcontrol/releases/download/v#{version}/majortom-linux-x64-v#{version}.tar.gz"
      sha256 "b92bc0701a45c7bc6b1f160415f5b0ecc38c95dd506905b3863225b4f4f4153b"
    end
  end

  def install
    bin.install "tom"
    libexec.install "daemon"
  end

  def post_install
    daemon_dir = Pathname.new("#{Dir.home}/.majortom/bin")
    daemon_dir.mkpath
    ln_sf libexec/"daemon", daemon_dir/"daemon"
  end

  def caveats
    <<~EOS
      The daemon has been linked to ~/.majortom/bin/daemon.

      Get started:
        tom daemon start -d
        tom daemon status
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tom --version")
  end
end
