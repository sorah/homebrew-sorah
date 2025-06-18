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
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dca43ac3f1f571912e4fd1a93898a5231305f9961088326cb620dcdbdb78c995"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "98684bc10da156c4fbfd7aa155d966c4fc693c058feae25b369d9d9a5a034050"
  end

  depends_on "protobuf" => :build
  depends_on "rust" => :build

  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args
  end
end
