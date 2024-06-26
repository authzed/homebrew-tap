# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class SpicedbAT1340 < Formula
  desc "Google Zanzibar-inspired permissions database for fine-grained access control"
  homepage "https://github.com/authzed/spicedb"
  version "1.34.0"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    on_intel do
      url "https://github.com/authzed/spicedb/releases/download/v1.34.0/spicedb_1.34.0_darwin_amd64.tar.gz"
      sha256 "534864ab83e3fce1a17b78916ab3caa5405846fd0f3f9679640c96ff7cf6ef02"

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
      url "https://github.com/authzed/spicedb/releases/download/v1.34.0/spicedb_1.34.0_darwin_arm64.tar.gz"
      sha256 "a0325bed3f5852764d30d709fda8a2f0c71f15c02a635d12e376fbc6932047c3"

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
        url "https://github.com/authzed/spicedb/releases/download/v1.34.0/spicedb_1.34.0_linux_amd64.tar.gz"
        sha256 "66343b507c4a2ba24562ddb0f0c0438f6bd3bd4af0bcf8a8740c110cb4c73d5a"

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
        url "https://github.com/authzed/spicedb/releases/download/v1.34.0/spicedb_1.34.0_linux_arm64.tar.gz"
        sha256 "937bffa95bf94f5c3fd5a01cf7554cc57dc46f0da61628c7c49ce03154375f79"

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
