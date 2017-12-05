class TasksController < ApplicationController
  def index
    @tasks = Task.all
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
      flash.now[:alert] = "Task creation failed"
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private
  def task_params
    params.require(:task).permit(:name, :due)
  end

end
