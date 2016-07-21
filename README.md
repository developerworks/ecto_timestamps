# EctoTimestamps

An elixir module that convert default utc timestamps to local timestamps in ecto.

**Note: Ecto 2.0 and above is required.**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add ecto_timestamps to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:ecto_timestamps, "~> 1.0.0"}]
  end
  ```

  2. Ensure ecto_timestamps is started before your application:

  ```elixir
  def application do
    [applications: [:ecto_timestamps]]
  end
  ```

## Usage

  Add a module attribute to your Ecto schema, for example:

  ```elixir
  defmodule <ProjectName>.Model.Role do
    @timestamps_opts [
      autogenerate: {EctoTimestamps.Local, :autogenerate, [:sec]}
    ]
    schema "role" do
      field :name, :string
      timestamps
    end
  end
  ```

  If you dont want to add `@timestamps_opts` module attribute in your every schema, you could create a module and use it.

  ```elixir
  defmodule <ProjectName>.Model do
    defmacro __using__(_opts) do
      quote do
        import Ecto.Query
        use Ecto.Schema
        alias Ecto.Changeset
        alias <ProjectName>.Repo

        @timestamps_opts [
          autogenerate: {EctoTimestamps.Local, :autogenerate, [:sec]}
        ]
      end
    end
  end
  ```

  And then `use` it in your Role schema

  ```elixir
  defmodule <ProjectName>.Model.Role do
    use <ProjectName>.Model

    schema "role" do
      field :name, :string
      timestamps
    end
  end
  ```
