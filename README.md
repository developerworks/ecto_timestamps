# EctoTimestamps

An elixir module that convert default utc timestamp to local timestamp in ecto.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add ecto_timestamps to your list of dependencies in `mix.exs`:

        def deps do
          [{:ecto_timestamps, "~> 0.0.1"}]
        end

  2. Ensure ecto_timestamps is started before your application:

        def application do
          [applications: [:ecto_timestamps]]
        end

## Usage

  Add a module attribute to your Ecto schema, for example:

  ```
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

  ```
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

  ```
  defmodule <ProjectName>.Model.Role do
    use <ProjectName>.Model

    schema "role" do
      field :name, :string
      timestamps
    end
  end
  ```
