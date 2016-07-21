defmodule EctoTimestamps.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ecto_timestamps,
      version: "1.0.0",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: package,
      deps: deps
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    []
  end

  def package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["developerworks"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => "https://github.com/developerworks/ecto_timestamps",
        "Docs"   => "https://github.com/developerworks/ecto_timestamps/README.md"
      }
   ]
  end
end