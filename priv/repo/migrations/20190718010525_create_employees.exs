defmodule PhoenixHello.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string
      add :gender, :string
      add :birthday, :date
      add :department_id, references(:departments, on_delete: :nothing)

      timestamps()
    end

    create index(:employees, [:department_id])
  end
end
