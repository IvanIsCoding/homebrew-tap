class Celq < Formula
  desc "A Common Expression Language (CEL) CLI Tool"
  homepage "https://github.com/IvanIsCoding/celq"
  url "https://github.com/IvanIsCoding/celq/archive/refs/tags/0.1.0.tar.gz"
  sha256 "997c716b902b4dfbad9adad765511b93253e3e66ad8abf3e70214638314b7cd8"
  license "MIT OR Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    output = shell_output("#{bin}/celq -n --arg='fruit:string=apple' 'fruit.contains(\"a\")'")
    assert_match "true", output
  end
end