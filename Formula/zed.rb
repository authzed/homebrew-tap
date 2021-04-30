class Zed < Formula
  desc "manage Authzed from your command line"
  homepage "https://authzed.com"
  head "https://github.com/authzed/zed.git", :branch => "main"

  depends_on "go" => :build

  def install
    system "go build ./cmd/zed"
    bin.install "zed"
  end

  test do
    system "#{bin}/zed --version"
  end
end
