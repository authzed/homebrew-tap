# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class SpicedbAT1250 < Formula
  desc "SpiceDB is a Zanzibar-inspired database that stores, computes, and validates application permissions."
  homepage "https://authzed.com/"
  version "1.25.0"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/authzed/spicedb/releases/download/v1.25.0/spicedb_1.25.0_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "708856557850fcbdbd2f984078c128fc9452ce758bf50ea8a8d6c7bbea24be8a"

      def install
        if build.head?
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/spicedb/releases/download/v1.25.0/spicedb_1.25.0_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "a61a79d90d25db1f323c21472e12364f98c92149c92ba0edd885ff4c7536d462"

      def install
        if build.head?
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/authzed/spicedb/releases/download/v1.25.0/spicedb_1.25.0_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "1d00409d56a0d1b0ea89a2551088343f5d280bced9b448f0561a7545330cae4f"

      def install
        if build.head?
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/spicedb/releases/download/v1.25.0/spicedb_1.25.0_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "15cb8eaef76716b2dfba5cc84500265bc2d25141af4c817db77792eb5aea2e13"

      def install
        if build.head?
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
  end

  head "https://github.com/authzed/spicedb.git", :branch => "main"

  test do
    system "#{bin}/spicedb version"
  end
end
