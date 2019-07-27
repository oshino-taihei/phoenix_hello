defmodule PhoenixHelloWeb.EmployeeView do
  use PhoenixHelloWeb, :view
  def select_list(list) do #Todo: name, idを可変に。また他ビューからも利用できるように共通化。
    list |> Enum.map(fn(x) -> {String.to_atom(x.name), x.id} end)
  end
end
