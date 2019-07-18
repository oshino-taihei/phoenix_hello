defmodule PhoenixHello.OrganizationTest do
  use PhoenixHello.DataCase

  alias PhoenixHello.Organization

  describe "departments" do
    alias PhoenixHello.Organization.Department

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def department_fixture(attrs \\ %{}) do
      {:ok, department} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organization.create_department()

      department
    end

    test "list_departments/0 returns all departments" do
      department = department_fixture()
      assert Organization.list_departments() == [department]
    end

    test "get_department!/1 returns the department with given id" do
      department = department_fixture()
      assert Organization.get_department!(department.id) == department
    end

    test "create_department/1 with valid data creates a department" do
      assert {:ok, %Department{} = department} = Organization.create_department(@valid_attrs)
      assert department.description == "some description"
      assert department.name == "some name"
    end

    test "create_department/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organization.create_department(@invalid_attrs)
    end

    test "update_department/2 with valid data updates the department" do
      department = department_fixture()
      assert {:ok, %Department{} = department} = Organization.update_department(department, @update_attrs)
      assert department.description == "some updated description"
      assert department.name == "some updated name"
    end

    test "update_department/2 with invalid data returns error changeset" do
      department = department_fixture()
      assert {:error, %Ecto.Changeset{}} = Organization.update_department(department, @invalid_attrs)
      assert department == Organization.get_department!(department.id)
    end

    test "delete_department/1 deletes the department" do
      department = department_fixture()
      assert {:ok, %Department{}} = Organization.delete_department(department)
      assert_raise Ecto.NoResultsError, fn -> Organization.get_department!(department.id) end
    end

    test "change_department/1 returns a department changeset" do
      department = department_fixture()
      assert %Ecto.Changeset{} = Organization.change_department(department)
    end
  end

  describe "employees" do
    alias PhoenixHello.Organization.Employee

    @valid_attrs %{birthday: ~D[2010-04-17], gender: "some gender", name: "some name"}
    @update_attrs %{birthday: ~D[2011-05-18], gender: "some updated gender", name: "some updated name"}
    @invalid_attrs %{birthday: nil, gender: nil, name: nil}

    def employee_fixture(attrs \\ %{}) do
      {:ok, employee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organization.create_employee()

      employee
    end

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Organization.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Organization.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      assert {:ok, %Employee{} = employee} = Organization.create_employee(@valid_attrs)
      assert employee.birthday == ~D[2010-04-17]
      assert employee.gender == "some gender"
      assert employee.name == "some name"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organization.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{} = employee} = Organization.update_employee(employee, @update_attrs)
      assert employee.birthday == ~D[2011-05-18]
      assert employee.gender == "some updated gender"
      assert employee.name == "some updated name"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Organization.update_employee(employee, @invalid_attrs)
      assert employee == Organization.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Organization.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Organization.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Organization.change_employee(employee)
    end
  end
end
