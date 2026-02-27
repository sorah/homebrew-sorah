class Mairu < Formula
  desc "AWS on-memory credentials agent"
  homepage "https://github.com/sorah/mairu"
  url "https://github.com/sorah/mairu/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "4b52f32761c8073ee0b066e2bf3e11c62307ed7f4c7d7ed59501a06a5a052879"
  license "Apache-2.0"
  head "https://github.com/sorah/mairu.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/sorah/sorah"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "aaf6ff64c9124341861b29679f04f032fd59d9e2f85d9de3ebc5088d88c6778d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2c3ede78e2256cf0527fd1671a27d9a7333cfa7f9275c7475525adf2f52ede65"
  end

  depends_on "protobuf" => :build
  depends_on "rust" => :build

  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args
  end
end
