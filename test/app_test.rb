require_relative "test_helper"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    App
  end

  def teardown
    Task.delete_all
    List.delete_all
  end

  def test_homepage_works
    response = get "/"
    assert_includes response.body, "Server"
  end

  def test_post_tasks
    response = post "/tasks", { name: "tastycakes", priority: "high" }
    assert_equal 1, Task.where(name: "tastycakes").count
  end

  # def test_patch_task
  #   tastycakes = Task.create({name: "Get me some tasty cakes"})
  #   response = patch "/tasks/#{tastycakes.id}/edit", { name: "Yummy Time", priority: "URGENT!" }
  #   assert_includes response.body, "Yummy Time"
  # end

  def test_delete_task
    tastycakes = Task.create(name: "Get me some tasty cakes")
    delete "/tasks/#{tastycakes.id}"
    assert_raises ActiveRecord::RecordNotFound do
      Task.find(tastycakes.id)
    end
  end

  def test_list_lists
    List.create(name: "Food")
    List.create(name: "Activities")
    response = get "/lists"
    assert_includes response.body, "Food"
  end

  def test_post_lists
    post "/lists", { name: "Grocery List" }
    assert_equal 1, List.where(name: "Grocery List").count
  end

  # def test_add_task_to_list
  #   food = List.create(name: "Food")
  #   tastycakes = Task.create(name: "Get me some tasty cakes")
  #   response = get "/lists/#{food.id}/tasks/#{tastycakes.id}"
  #   assert_equal food.id, JSON.parse(response.body)["list_id"]
  # end


  def test_delete_list
    food = List.create(name: "Food")
    delete "/lists/#{food.id}"
    assert_raises ActiveRecord::RecordNotFound do
      List.find(food.id)
    end
  end
end
