# Todo List with API -Server

This program allows you to create tasks and lists to organize what you need to do.
FYI all / will be after HTTP://localhost:4567/...

## Get Tasks
```ruby
"/tasks"
```
Go to a webpage that lists all tasks. Here the user will have the option to edit, delete or mark a task complete.

## Make new Tasks
```ruby
"/new"
```
This web page will allow the user to create a new task to be saved in the database.

## Edit Task
```ruby
patch "/tasks/:id/edit"
```
This webpage will allow the user to edit all aspects of a task, including assigning a task to list. The link
to this page is available on the /tasks page.

## Get Lists
```ruby
"/lists"
```
This webpage will print a list of all lists with the option to delete each list.

## Create Lists
```ruby
get "/lists/new"
```
This webpage has a link in the main nav bar and allows a user to create a new list.
