require_relative "app_helper"

class App < Sinatra::Base
  BOOT_TIME = Time.now
  set :method_override, true

  # You can delete this route but you should nest your endpoints under /api
  get "/" do
    erb :"home.html"
  end

  get "/tasks" do
    @tasks = Task.all
    erb :"tasks.html"
  end

  post "/tasks" do
    Task.create(params)
    redirect to("/tasks")
  end

  get "/tasks/new" do
    erb :"new_task.html"
  end

  get "/tasks/:id/complete" do
    @task = Task.find(params["id"])
    @task.complete
    @task.save
    redirect to("/tasks")
  end

  get "/tasks/:id/edit" do
    @tasks = Task.find(params["id"])
    erb :"edit_task.html"
  end

  patch "/tasks/:id/edit" do
    @task = Task.find(params["id"])
    @task.update(params["task"])
    redirect to("/tasks")
  end

  delete "/tasks/:id" do
    @task = Task.find(params["id"])
    @task.destroy
    redirect to("/tasks")
  end

  get "/lists" do
    @lists = List.all
    erb :"lists.html"
  end

  post "/lists" do
    List.create(params)
    redirect to("/lists")
  end

  get "/lists/new" do
    erb :"new_list.html"
  end

  get "/lists/:list_id/tasks/:task_id" do
  end

  get "/lists/:list_id/tasks" do
    @list = List.find(params["list_id"])
    erb :"view_lists_tasks.html"
  end

  delete "/lists/:id" do
    @list = List.find(params["id"])
    @list.destroy
    redirect to("/lists")
  end

  # If this file is run directly boot the webserver
  run! if app_file == $PROGRAM_NAME
end
