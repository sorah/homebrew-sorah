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
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bd7d04415b5335f1ff57670d8f57825d2b27a0fece1b0081f29700c4120beb21"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c42f4668829c3e4433b569ad50952505abe3d568250f00a60b44b8f0d18f9b02"
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
