class TasksController < ApplicationController
  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Wooo! New Task!!!!"
      redirect_to @task
    else
      # nothing, yet
    end
  end

  private
  def task_params
    params
  end

end
