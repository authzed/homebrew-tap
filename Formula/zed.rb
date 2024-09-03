# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zed < Formula
  desc "command-line client for managing SpiceDB"
  homepage "https://github.com/authzed/zed"
  version "0.21.1"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    on_intel do
      url "https://github.com/authzed/zed/releases/download/v0.21.1/zed_0.21.1_darwin_amd64.tar.gz"
      sha256 "cc94ba0288f5714760b6c994761dfe1bcc8fe8918df7dec7aa020282ae108eae"

      def install
        if build.head?
            versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
            versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
            system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/zed"
        end
        bin.install "zed"
        generate_completions_from_executable(bin/"zed", "completion", shells: [:bash, :zsh, :fish])
      end
    end
    on_arm do
      url "https://github.com/authzed/zed/releases/download/v0.21.1/zed_0.21.1_darwin_arm64.tar.gz"
      sha256 "c76abc08e71cdbb5dbae25f48a4f1db78f47da2aa41d733a0270d950a3b06690"

      def install
        if build.head?
            versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
            versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
            system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/zed"
        end
        bin.install "zed"
        generate_completions_from_executable(bin/"zed", "completion", shells: [:bash, :zsh, :fish])
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/authzed/zed/releases/download/v0.21.1/zed_0.21.1_linux_amd64_gnu.tar.gz"
        sha256 "a8d88bc5560cda87b885d38731848a12d5d28a51e07fd4967f5a204b179c061b"

        def install
          if build.head?
              versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
              versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
              system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/zed"
          end
          bin.install "zed"
          generate_completions_from_executable(bin/"zed", "completion", shells: [:bash, :zsh, :fish])
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/authzed/zed/releases/download/v0.21.1/zed_0.21.1_linux_arm64_gnu.tar.gz"
        sha256 "b52f8271fbf6d918c09c2603189a8decaaaa72e3569ff353e7280cd7acca4f66"

        def install
          if build.head?
              versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
              versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
              system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/zed"
          end
          bin.install "zed"
          generate_completions_from_executable(bin/"zed", "completion", shells: [:bash, :zsh, :fish])
        end
      end
    end
  end

  head "https://github.com/authzed/zed.git", :branch => "main"

  test do
    system "#{bin}/zed version"
  end
end
