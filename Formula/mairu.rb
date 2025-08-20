class Mairu < Formula
  desc "AWS on-memory credentials agent"
  homepage "https://github.com/sorah/mairu"
  url "https://github.com/sorah/mairu/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "27c08a83c0d4e73a2f18e503ebf37855e65800e228ea13f028281938e1422c2e"
  license "Apache-2.0"
  head "https://github.com/sorah/mairu.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/sorah/sorah"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "19a9d55fef083005168896e7a5fdeafce4478c372a0f653e46a9c6d3993cbead"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2b88ad3d5d9ed2a045c7e53816c9e674af398d73ac73ab5ecf2f19f08ad23415"
  end

  depends_on "protobuf" => :build
  depends_on "rust" => :build

  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args
  end
end
