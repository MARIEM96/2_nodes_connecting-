defmodule Roomchat.Application do
  @moduledoc false

    use Application

    def start(_type, _args) do
      children = [
        Roomchat
      ]
      opts = [strategy: :one_for_one, name: Roomchat.Supervisor]
      Supervisor.start_link(children, opts)

  end
end
