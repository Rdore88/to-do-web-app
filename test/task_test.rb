require_relative "test_helper"

class TaskTest < Minitest::Test
  def teardown
    Task.delete_all
    List.delete_all
  end

  def test_task_exists
    assert Task
  end

  def test_create_test
    laundry = Task.create(name: "Laundry", priority: "Urgent")
    assert laundry.persisted?
    assert_equal "Laundry", laundry.name
  end

  def test_completed_at
    laundry = Task.create(name: "Laundry", priority: "Urgent")
    assert_in_delta laundry.complete, Time.now, 1
  end
end
