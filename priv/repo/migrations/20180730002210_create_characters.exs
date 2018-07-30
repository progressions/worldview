defmodule Worldview.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
      add :archetype, :string
      add :career, :string
      add :player_name, :string
      add :brawn, :integer
      add :agility, :integer
      add :intellect, :integer
      add :cunning, :integer
      add :willpower, :integer
      add :presence, :integer
      add :soak, :integer
      add :strain_threshold, :integer
      add :strain, :integer
      add :wound_threshold, :integer
      add :wounds, :integer
      add :melee_defense, :integer
      add :ranged_defense, :integer

      timestamps()
    end

  end
end
