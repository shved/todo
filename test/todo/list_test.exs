defmodule Todo.ListTest do
  use ExUnit.Case

  alias Todo.Item
  alias Todo.List

  setup do
    {:ok, list} = List.start_link("Shop")
    {:ok, list: list}
  end

  test ".items returns todos on the list", %{list: list} do
    assert List.items(list) == []
  end

  test ".add adds an item to the list", %{list: list} do
    item = Item.new("2 eggs")
    List.add(list, item)

    assert List.items(list) == [item]
  end

  test ".update can mark an item completed", %{list: list} do
    item = Item.new("a cucumber")
    List.add(list, item)

    # Update the item
    item = %{item | completed: true}
    List.update(list, item)

    assert List.items(list) == [item]
  end
end
