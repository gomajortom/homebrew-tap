class Majortom < Formula
  desc "Major Tom — AI agent orchestration CLI"
  homepage "https://gomajortom.com"
  version "0.1.0"
  license "Apache-2.0"
  # TODO: Update sha256 values after first release build.
  # Run: shasum -a 256 majortom-*.tar.gz

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gomajortom/groundcontrol/releases/download/v#{version}/majortom-darwin-arm64-v#{version}.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/gomajortom/groundcontrol/releases/download/v#{version}/majortom-darwin-x64-v#{version}.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gomajortom/groundcontrol/releases/download/v#{version}/majortom-linux-arm64-v#{version}.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/gomajortom/groundcontrol/releases/download/v#{version}/majortom-linux-x64-v#{version}.tar.gz"
      sha256 "PLACEHOLDER"
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
