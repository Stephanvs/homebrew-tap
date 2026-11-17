class Openspeak < Formula
  desc "Small command-line text-to-speech client"
  homepage "https://openspeak.sh"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stephanvs/OpenSpeak/releases/download/v0.1.1/openspeak-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "8ca439eabaec066f9060b6c5fcab380e84876a5207afac7baa2a8eab4c92fc25"
    end
    on_intel do
      url "https://github.com/Stephanvs/OpenSpeak/releases/download/v0.1.1/openspeak-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "de13c2f9c3166a34f1be6af22038a31169dad48c23a1fa25831fa00932654af2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stephanvs/OpenSpeak/releases/download/v0.1.1/openspeak-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a5aca8ea07e1ef4bea9cdf18bd928bb202b69c636e45fd69118f709de2972c5e"
    end
    on_intel do
      url "https://github.com/Stephanvs/OpenSpeak/releases/download/v0.1.1/openspeak-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7f7bdc14652466cd400302a001290b99dd342fca30217d385c34f9119e6d17e"
    end
  end

  def install
    bin.install "openspeak"
  end

  def caveats
    on_linux do
      <<~CAVEATS
        openspeak loads your distribution's ALSA library at runtime.
        On Debian and Ubuntu: sudo apt install libasound2t64 (libasound2 before 24.04)
      CAVEATS
    end
  end

  test do
    assert_match "openspeak #{version}", shell_output("#{bin}/openspeak --version")
  end
end
