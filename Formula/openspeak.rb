class Openspeak < Formula
  desc "Small command-line text-to-speech client"
  homepage "https://openspeak.sh"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stephanvs/OpenSpeak/releases/download/v0.1.0/openspeak-aarch64-apple-darwin.tar.gz"
      sha256 "3750c9211358c0c9f912549915069c1b98ca3aafe1b0db778295afd47142cb8d"
    end
    on_intel do
      url "https://github.com/Stephanvs/OpenSpeak/releases/download/v0.1.0/openspeak-x86_64-apple-darwin.tar.gz"
      sha256 "276d4d300c39657eb6d4688f410884ab1f5c5c18d67a6254f3b031c94ac73c3a"
    end
  end

  on_linux do
    depends_on "alsa-lib"

    on_arm do
      url "https://github.com/Stephanvs/OpenSpeak/releases/download/v0.1.0/openspeak-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "418e33c5ffb2ced63533dbcef2d7453198037d7724aa30fe7eab07ece1bee69f"
    end
    on_intel do
      url "https://github.com/Stephanvs/OpenSpeak/releases/download/v0.1.0/openspeak-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a5a5d75ca89b914eb565625f91817070b29c132afa1fd730464019134446df3"
    end
  end

  def install
    bin.install "openspeak"
  end

  test do
    assert_match "openspeak #{version}", shell_output("#{bin}/openspeak --version")
  end
end
