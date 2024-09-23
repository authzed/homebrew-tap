# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class SpicedbAT1362 < Formula
  desc "Google Zanzibar-inspired permissions database for fine-grained access control"
  homepage "https://github.com/authzed/spicedb"
  version "1.36.2"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    on_intel do
      url "https://github.com/authzed/spicedb/releases/download/v1.36.2/spicedb_1.36.2_darwin_amd64.tar.gz"
      sha256 "ffe9ca88b1e2f612b293fe74f2778a3681a49ba27ff06916ae1bf7c76a41be5c"

      def install
        if build.head?
          versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
          versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
          system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/spicedb"
        end
        bin.install "spicedb"
        generate_completions_from_executable(bin/"spicedb", "completion", shells: [:bash, :zsh, :fish])
      end
    end
    on_arm do
      url "https://github.com/authzed/spicedb/releases/download/v1.36.2/spicedb_1.36.2_darwin_arm64.tar.gz"
      sha256 "6aef23bb8d6485e001bde6459bd73d83ef93cc24614fc9abe4c9921bfcdb6753"

      def install
        if build.head?
          versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
          versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
          system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/spicedb"
        end
        bin.install "spicedb"
        generate_completions_from_executable(bin/"spicedb", "completion", shells: [:bash, :zsh, :fish])
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/authzed/spicedb/releases/download/v1.36.2/spicedb_1.36.2_linux_amd64.tar.gz"
        sha256 "01f308b52d6d4051e26e900f2832f22a4a444113c076f828793685c63c2e54fc"

        def install
          if build.head?
            versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
            versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
            system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/spicedb"
          end
          bin.install "spicedb"
          generate_completions_from_executable(bin/"spicedb", "completion", shells: [:bash, :zsh, :fish])
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/authzed/spicedb/releases/download/v1.36.2/spicedb_1.36.2_linux_arm64.tar.gz"
        sha256 "7551b04f5fe47bc59aed71f494de340ca186c117f4a9cc8a0c61676894b45003"

        def install
          if build.head?
            versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
            versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
            system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/spicedb"
          end
          bin.install "spicedb"
          generate_completions_from_executable(bin/"spicedb", "completion", shells: [:bash, :zsh, :fish])
        end
      end
    end
  end

  head "https://github.com/authzed/spicedb.git", :branch => "main"

  test do
    system "#{bin}/spicedb version"
  end
end