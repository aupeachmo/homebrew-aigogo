class Aigogo < Formula
  desc "Make packaging and distributing your AI agents a breeze"
  homepage "https://github.com/aupeachmo/aigogo"
  version "0.0.3"
  license "MPL-2.0"

  on_macos do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.3/aigogo-darwin-amd64.tar.gz"
      sha256 "4bab187260e2639131f74d72a5b65da8cab7199ccb7fbf3324725ece18adb7f6"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.3/aigogo-darwin-arm64.tar.gz"
      sha256 "e171bcbe7b549581cd465ff6e5620b8a8fbff062ec1e2e0158c338adfeb20bf4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.3/aigogo-linux-amd64.tar.gz"
      sha256 "7127cf0443c4d404f9a275ce6f6134652d75a60e61244f2ab3b80da3f9c4b8d2"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.3/aigogo-linux-arm64.tar.gz"
      sha256 "71ef740f95d09a1e195a210a3df133271f6bf562b0e5f93e96e3eb0c7c893bba"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "aigogo-darwin-arm64" => "aigogo"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "aigogo-darwin-amd64" => "aigogo"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "aigogo-linux-arm64" => "aigogo"
    elsif OS.linux?
      bin.install "aigogo-linux-amd64" => "aigogo"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigogo version")
  end
end
