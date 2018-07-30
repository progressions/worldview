defmodule WorldviewWeb.CharacterControllerTest do
  use WorldviewWeb.ConnCase

  alias Worldview.Characters

  @create_attrs %{
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

  def fixture(:character) do
    {:ok, character} = Characters.create_character(@create_attrs)
    character
  end

  describe "index" do
    test "lists all characters", %{conn: conn} do
      conn = get(conn, character_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Characters"
    end
  end

  describe "new character" do
    test "renders form", %{conn: conn} do
      conn = get(conn, character_path(conn, :new))
      assert html_response(conn, 200) =~ "New Character"
    end
  end

  describe "create character" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, character_path(conn, :create), character: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == character_path(conn, :show, id)

      conn = get(conn, character_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Character"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, character_path(conn, :create), character: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Character"
    end
  end

  describe "edit character" do
    setup [:create_character]

    test "renders form for editing chosen character", %{conn: conn, character: character} do
      conn = get(conn, character_path(conn, :edit, character))
      assert html_response(conn, 200) =~ "Edit Character"
    end
  end

  describe "update character" do
    setup [:create_character]

    test "redirects when data is valid", %{conn: conn, character: character} do
      conn = put(conn, character_path(conn, :update, character), character: @update_attrs)
      assert redirected_to(conn) == character_path(conn, :show, character)

      conn = get(conn, character_path(conn, :show, character))
      assert html_response(conn, 200) =~ "some updated archetype"
    end

    test "renders errors when data is invalid", %{conn: conn, character: character} do
      conn = put(conn, character_path(conn, :update, character), character: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Character"
    end
  end

  describe "delete character" do
    setup [:create_character]

    test "deletes chosen character", %{conn: conn, character: character} do
      conn = delete(conn, character_path(conn, :delete, character))
      assert redirected_to(conn) == character_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, character_path(conn, :show, character))
      end)
    end
  end

  defp create_character(_) do
    character = fixture(:character)
    {:ok, character: character}
  end
end
