# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zed < Formula
  desc "manage Authzed from your command line."
  homepage "https://authzed.com/"
  version "0.1.3"
  license "Apache-2.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/authzed/zed/releases/download/v0.1.3/zed_0.1.3_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "c361d0c87948a81e4962a7157b25a1d364de924771f47c625e42d5ea4e6cb9d0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.1.3/zed_0.1.3_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "68a1f38f158231bfed32cd3c723e43ef5d474c5c66c88e8d495230b34b6d0bf0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/authzed/zed/releases/download/v0.1.3/zed_0.1.3_linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "f2eb5725ecd04e6723246336412f02148dfd8b057c22bae8d9eb4f0e39a51ab7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.1.3/zed_0.1.3_linux_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "137acd8aba2430d7581cf9796b35a88452ddbcde433447f413aa87e4faf783da"
    end
  end

  head "https://github.com/authzed/zed.git", :branch => "main"

  depends_on "go" => :build

  def install
    if !File.exists? "zed"
      system "go build --ldflags \"-s -w -X github.com/authzed/zed/internal/version.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
    end
    bin.install "zed"
    (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
    (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
    (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
  end

  test do
    system "#{bin}/zed version"
  end
end
