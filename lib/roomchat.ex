defmodule Roomchat do
  use GenServer

  def start_link(args) do
    name = {:global, :"#{node()}-chat"} |> IO.inspect(label: "Name")
    GenServer.start_link(__MODULE__, args, name: name)
  end

  def init(_) do
    {:ok, []}
  end

  def send_message(message) do
    noeud = Node.list() |> List.first |> IO.inspect(label: "Destinataire")
    GenServer.cast({:global, :"#{noeud}-chat"}, {:receive, message})
  end

  def handle_cast({:receive, message}, state) do
    IO.puts(message)
    {:noreply, state}
  end

  def handle_info(params, state) do
    params |> IO.inspect(label: "Params")
    {:noreply, state}
  end

end
