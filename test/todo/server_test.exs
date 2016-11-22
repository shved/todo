defmodule Todo.ServerTest do
  use ExUnit.Case

  alias Todo.Server

  test ".add_list adds a new supervised todo list" do
    Server.add_list("Shop")
    Server.add_list("Home")
    counts = Supervisor.count_children(Server)

    assert counts.active == 2
  end
end
