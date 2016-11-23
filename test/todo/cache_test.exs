defmodule Todo.CacheTest do
  use ExUnit.Case

  alias Todo.Cache

  setup do
    list = %{name: "Shop", items: []}
    Cache.save(list)

    {:ok, list: list}
  end

  test ".save adds a list to the ETS table" do
    info = :ets.info(Cache)
    assert info[:size] == 1
  end
end
