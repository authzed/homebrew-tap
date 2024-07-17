# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class SpicedbAT1331 < Formula
  desc "SpiceDB is a Zanzibar-inspired database that stores, computes, and validates application permissions."
  homepage "https://authzed.com/"
  version "1.33.1"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    on_intel do
      url "https://github.com/authzed/spicedb/releases/download/v1.33.1/spicedb_1.33.1_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "0a86a86db70565e498ee1056eac0209edcbdb97ce998431dbfe4b776506000de"

      def install
        if build.head?
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        bash_completion.install "completions/spicedb.bash" => "spicedb"
        zsh_completion.install "completions/spicedb.zsh" => "_spicedb"
        fish_completion.install "completions/spicedb.fish"
      end
    end
    on_arm do
      url "https://github.com/authzed/spicedb/releases/download/v1.33.1/spicedb_1.33.1_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "1ce81aef06cac30a9aaa290f17ab6506788b2d6770ea12f8d4ab0781d499bf0c"

      def install
        if build.head?
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        bash_completion.install "completions/spicedb.bash" => "spicedb"
        zsh_completion.install "completions/spicedb.zsh" => "_spicedb"
        fish_completion.install "completions/spicedb.fish"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/authzed/spicedb/releases/download/v1.33.1/spicedb_1.33.1_linux_amd64.tar.gz", using: CurlDownloadStrategy
        sha256 "fe19e9aa21cb888b9eda91ae4689a17c085fb75b1ab973d801ffee7d4b15c72a"

        def install
          if build.head?
            system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
          end
          bin.install "spicedb"
          bash_completion.install "completions/spicedb.bash" => "spicedb"
          zsh_completion.install "completions/spicedb.zsh" => "_spicedb"
          fish_completion.install "completions/spicedb.fish"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/authzed/spicedb/releases/download/v1.33.1/spicedb_1.33.1_linux_arm64.tar.gz", using: CurlDownloadStrategy
        sha256 "700041818679fe697abeee916765d7cd2da348723a3789ccb3ae701f559ab245"

        def install
          if build.head?
            system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
          end
          bin.install "spicedb"
          bash_completion.install "completions/spicedb.bash" => "spicedb"
          zsh_completion.install "completions/spicedb.zsh" => "_spicedb"
          fish_completion.install "completions/spicedb.fish"
        end
      end
    end
  end

  head "https://github.com/authzed/spicedb.git", :branch => "main"

  test do
    system "#{bin}/spicedb version"
  end
end