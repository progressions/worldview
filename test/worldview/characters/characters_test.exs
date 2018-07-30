defmodule Worldview.CharactersTest do
  use Worldview.DataCase

  alias Worldview.Characters

  describe "characters" do
    alias Worldview.Characters.Character

    @valid_attrs %{
      agility: 42,
      archetype: "some archetype",
      brawn: 42,
      career: "some career",
      cunning: 42,
      intellect: 42,
      melee_defense: 42,
      name: "some name",
      player_name: "some player_name",
      presence: 42,
      ranged_defense: 42,
      soak: 42,
      strain: 42,
      strain_threshold: 42,
      willpower: 42,
      wound_threshold: 42,
      wounds: 42
    }
    @update_attrs %{
      agility: 43,
      archetype: "some updated archetype",
      brawn: 43,
      career: "some updated career",
      cunning: 43,
      intellect: 43,
      melee_defense: 43,
      name: "some updated name",
      player_name: "some updated player_name",
      presence: 43,
      ranged_defense: 43,
      soak: 43,
      strain: 43,
      strain_threshold: 43,
      willpower: 43,
      wound_threshold: 43,
      wounds: 43
    }
    @invalid_attrs %{
      agility: nil,
      archetype: nil,
      brawn: nil,
      career: nil,
      cunning: nil,
      intellect: nil,
      melee_defense: nil,
      name: nil,
      player_name: nil,
      presence: nil,
      ranged_defense: nil,
      soak: nil,
      strain: nil,
      strain_threshold: nil,
      willpower: nil,
      wound_threshold: nil,
      wounds: nil
    }

    def character_fixture(attrs \\ %{}) do
      {:ok, character} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Characters.create_character()

      character
    end

    test "list_characters/0 returns all characters" do
      character = character_fixture()
      assert Characters.list_characters() == [character]
    end

    test "get_character!/1 returns the character with given id" do
      character = character_fixture()
      assert Characters.get_character!(character.id) == character
    end

    test "create_character/1 with valid data creates a character" do
      assert {:ok, %Character{} = character} = Characters.create_character(@valid_attrs)
      assert character.agility == 42
      assert character.archetype == "some archetype"
      assert character.brawn == 42
      assert character.career == "some career"
      assert character.cunning == 42
      assert character.intellect == 42
      assert character.melee_defense == 42
      assert character.name == "some name"
      assert character.player_name == "some player_name"
      assert character.presence == 42
      assert character.ranged_defense == 42
      assert character.soak == 42
      assert character.strain == 42
      assert character.strain_threshold == 42
      assert character.willpower == 42
      assert character.wound_threshold == 42
      assert character.wounds == 42
    end

    test "create_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Characters.create_character(@invalid_attrs)
    end

    test "update_character/2 with valid data updates the character" do
      character = character_fixture()
      assert {:ok, character} = Characters.update_character(character, @update_attrs)
      assert %Character{} = character
      assert character.agility == 43
      assert character.archetype == "some updated archetype"
      assert character.brawn == 43
      assert character.career == "some updated career"
      assert character.cunning == 43
      assert character.intellect == 43
      assert character.melee_defense == 43
      assert character.name == "some updated name"
      assert character.player_name == "some updated player_name"
      assert character.presence == 43
      assert character.ranged_defense == 43
      assert character.soak == 43
      assert character.strain == 43
      assert character.strain_threshold == 43
      assert character.willpower == 43
      assert character.wound_threshold == 43
      assert character.wounds == 43
    end

    test "update_character/2 with invalid data returns error changeset" do
      character = character_fixture()
      assert {:error, %Ecto.Changeset{}} = Characters.update_character(character, @invalid_attrs)
      assert character == Characters.get_character!(character.id)
    end

    test "delete_character/1 deletes the character" do
      character = character_fixture()
      assert {:ok, %Character{}} = Characters.delete_character(character)
      assert_raise Ecto.NoResultsError, fn -> Characters.get_character!(character.id) end
    end

    test "change_character/1 returns a character changeset" do
      character = character_fixture()
      assert %Ecto.Changeset{} = Characters.change_character(character)
    end
  end
end
