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
    root_url "https://ghcr.io/v2/sorah/sorah"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e73f7b794d24f885ef4a4b6235a819727e025191b04b4a87e49bc2c2517e7f29"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "284229a0f332ffe85c70b42f551e6986443968487882f3dcbb7d5d8a5f01086b"
  end

  depends_on "protobuf" => :build
  depends_on "rust" => :build

  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args
  end
end
