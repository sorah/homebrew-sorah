class Mairu < Formula
  desc "AWS on-memory credentials agent"
  homepage "https://github.com/sorah/mairu"
  url "https://github.com/sorah/mairu/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "5e6da78946dd74da63d6bced300e4d2b712740e66280e87aad6ffd957a9854f1"
  license "Apache-2.0"
  head "https://github.com/sorah/mairu.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/sorah/homebrew-sorah/releases/download/mairu-0.8.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f998482b1ca1cc1cf9300c70927acd8479c4cd29e936fb6a1cfa06ed17e0763b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "45f51e922800482e9e170059730a9b7713fd52c93e963e1f1c317ff75756ed95"
  end

  depends_on "protobuf" => :build
  depends_on "rust" => :build

  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args
  end
end
