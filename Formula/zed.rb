class Zed < Formula
  desc "manage Authzed from your command line"
  homepage "https://authzed.com"
  head "https://github.com/authzed/zed.git", :branch => "main"

  depends_on "go" => :build

  def install
    system "go build --ldflags \"-s -w -X github.com/authzed/zed/internal/version.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
    bin.install "zed"
  end

  test do
    system "#{bin}/zed --version"
  end
end
