# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zed < Formula
  desc "command-line client for managing SpiceDB"
  homepage "https://github.com/authzed/zed"
  version "0.24.0"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    on_intel do
      url "https://github.com/authzed/zed/releases/download/v0.24.0/zed_0.24.0_darwin_amd64.tar.gz"
      sha256 "db0cd241aeba6a4fd8b5e46c3990b76e237b2d97783a685f4717e2cbc61cd9ba"

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
      url "https://github.com/authzed/zed/releases/download/v0.24.0/zed_0.24.0_darwin_arm64.tar.gz"
      sha256 "5c26e2eae4fafbd43854c85b2ded7c88e10bbaae986468971f36bd554478560f"

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
        url "https://github.com/authzed/zed/releases/download/v0.24.0/zed_0.24.0_linux_amd64_gnu.tar.gz"
        sha256 "9a5f9cc78427e29714d43e5a56b2a94b482b1ed418d7751ebc1225945d2bac08"

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
        url "https://github.com/authzed/zed/releases/download/v0.24.0/zed_0.24.0_linux_arm64_gnu.tar.gz"
        sha256 "ea9596f74f005966e20c68ae91aff1839801fd9f1bb706c628a4293546389130"

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
