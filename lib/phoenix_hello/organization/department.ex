defmodule PhoenixHello.Organization.Department do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixHello.Organization.Employee

  schema "departments" do
    field :description, :string
    field :name, :string
    has_many :employees, Employee

    timestamps()
  end

  @doc false
  def changeset(department, attrs) do
    department
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
