# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zed < Formula
  desc "manage Authzed from your command line."
  homepage "https://authzed.com/"
  version "0.12.0"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/authzed/zed/releases/download/v0.12.0/zed_0.12.0_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "5639a630c3d8616c0fe023fdfdef093fc0b4694082d64006e6778ba01ec51665"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.12.0/zed_0.12.0_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "0d05d593b832232a3fba09a757fa5889c357608e7199a205585bb7f36ac96871"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/authzed/zed/releases/download/v0.12.0/zed_0.12.0_linux_arm64_gnu.tar.gz", using: CurlDownloadStrategy
      sha256 "e11dbdf17b5af3f5379bb9b649f59e43e8f627452a25626ed280613a29a54160"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.12.0/zed_0.12.0_linux_amd64_gnu.tar.gz", using: CurlDownloadStrategy
      sha256 "7c915f052f9004c7a17f35350605c5ebdab752415ecf7307865fb9a0738e083b"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
  end

  head "https://github.com/authzed/zed.git", :branch => "main"

  test do
    system "#{bin}/zed version"
  end
end
