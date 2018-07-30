defmodule Worldview.Characters.Character do
  use Ecto.Schema
  import Ecto.Changeset

  schema "characters" do
    field(:agility, :integer)
    field(:archetype, :string)
    field(:brawn, :integer)
    field(:career, :string)
    field(:cunning, :integer)
    field(:intellect, :integer)
    field(:melee_defense, :integer)
    field(:name, :string)
    field(:player_name, :string)
    field(:presence, :integer)
    field(:ranged_defense, :integer)
    field(:soak, :integer)
    field(:strain, :integer)
    field(:strain_threshold, :integer)
    field(:willpower, :integer)
    field(:wound_threshold, :integer)
    field(:wounds, :integer)

    timestamps()
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, [
      :name,
      :archetype,
      :career,
      :player_name,
      :brawn,
      :agility,
      :intellect,
      :cunning,
      :willpower,
      :presence,
      :soak,
      :strain_threshold,
      :strain,
      :wound_threshold,
      :wounds,
      :melee_defense,
      :ranged_defense
    ])
    |> validate_required([
      :name,
      :archetype,
      :career,
      :player_name,
      :brawn,
      :agility,
      :intellect,
      :cunning,
      :willpower,
      :presence,
      :soak,
      :strain_threshold,
      :strain,
      :wound_threshold,
      :wounds,
      :melee_defense,
      :ranged_defense
    ])
  end
end
