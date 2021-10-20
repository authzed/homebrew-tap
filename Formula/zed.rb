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
      sha256 "7c3101ed02811c64cc79ca3c7edd6af2fd801c356f1ff9cbf0ea3025935ae043"
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.1.3/zed_0.1.3_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "f3c150a5f888ea56bb843494d56997c42c41ace157502887e98d2a46e4fd08fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/authzed/zed/releases/download/v0.1.3/zed_0.1.3_linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "838b838eaafb6fda4075358add28a0be91f01d8ea1c690365dc4ed7b85f99ee6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.1.3/zed_0.1.3_linux_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "3888fa6fd6be591f90079df9bc6fea94da0f6b3d324c31ca1468a196f45e2338"
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
