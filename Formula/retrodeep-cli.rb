class RetrodeepCli < Formula
  include Language::Python::Virtualenv

  desc "RetroDeep CLI is a powerful, user-friendly command-line interface designed to supercharge your development workflow by enabling you to deploy, manage, and scale your applications directly from the terminal." 
  homepage "https://github.com/retrodeep-io/retrodeep-cli"
  url "https://github.com/retrodeep-io/retrodeep-cli/archive/refs/tags/v1.0.0-beta.1.tar.gz"
  sha256 "7c2a3bc9265f8e7c2ab72b7480e540cc208d471dc53e1dc2f8f057600c8b99c2"
  license "MIT"
  version "1.0.0-beta.2"

  depends_on "python@3"

  def install
      virtualenv_create(libexec, "python3")
      system libexec/"bin/pip", "install", "-r", "requirements.txt"

      bin.install_symlink libexec/"bin/retrodeep" => "retrodeep"
  end

  test do
      system "#{bin}/retrodeep", "whoami"
  end
end