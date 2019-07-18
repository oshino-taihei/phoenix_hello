defmodule PhoenixHello.Organization.Employee do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixHello.Organization.Department

  schema "employees" do
    field :birthday, :date
    field :gender, :string
    field :name, :string
    belongs_to :department, Department

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name, :department_id, :gender, :birthday])
    |> validate_required([:name, :gender, :birthday])
  end
end
