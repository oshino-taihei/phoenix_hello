defmodule PhoenixHelloWeb.HelloController do
    use PhoenixHelloWeb, :controller

    def hello(conn, _params) do
        conn
        |> redirect(to: Routes.employee_path(conn, :index))
        |> halt()
    end
end