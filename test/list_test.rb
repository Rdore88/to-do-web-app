require_relative "test_helper"

class ListTest < Minitest::Test

  def teardown
    Task.delete_all
    List.delete_all
  end

  def test_list_exists
    assert List
  end

  def test_create_list
    weekend_chores = List.create(name: "Weekend Chores")
    assert weekend_chores.persisted?
    assert_equal "Weekend Chores", weekend_chores.name
  end

  def tests_add_chore
    weekend_chores = List.create(name: "Weekend Chores")
    laundry = Task.create(name: "Laundry", priority: "Urgent")
    weekend_chores.add_task(laundry)
    assert_equal 1, weekend_chores.tasks.count
  end
end
