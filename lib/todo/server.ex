defmodule Todo.Server do
  use Supervisor

  def add_list(name) do
    Supervisor.start_child(__MODULE__, [name])
  end

  ###
  # Supervisor API
  ###

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = [
      worker(Todo.List, [], restart: :transient)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
