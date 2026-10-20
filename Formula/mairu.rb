class Mairu < Formula
  desc "AWS on-memory credentials agent"
  homepage "https://github.com/sorah/mairu"
  url "https://github.com/sorah/mairu/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "270a6b364343666855724f3de98967dc1dce8fdf210510d66e4eded42de06d0d"
  license "Apache-2.0"
  head "https://github.com/sorah/mairu.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/sorah/sorah"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "83d01b68ddd3d6d814e85d327009282aada165f0e91360e5ac53136230384129"
    sha256 cellar: :any,                 x86_64_linux:  "3708d6e5d791578905a41512069294ac327669354df99420d5cb4a4072b26d45"
  end

  depends_on "protobuf" => :build
  depends_on "rust" => :build

  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mairu --version")
  end
end
