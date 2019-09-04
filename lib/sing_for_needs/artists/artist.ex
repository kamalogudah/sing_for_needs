defmodule SingForNeeds.Artists.Artist do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias SingForNeeds.Performances.Performance

  schema "artists" do
    field :name, :string
    field :bio, :string
    many_to_many(:performances, Performance, join_through: "artists_performances", on_replace: :delete)
    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:name, :bio])
    |> validate_required([:name, :bio])
  end
end
