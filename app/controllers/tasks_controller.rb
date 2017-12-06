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
      flash.now[:alert] = "Task creation failed :("
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "Yeahhhh look at that fresh and squeaky updated task!"
      redirect_to @task
    else
      flash.now[:alert] = "Task editing failed :("
      render "edit"
    end 
  end

  private
  def task_params
    params.require(:task).permit(:name, :due)
  end

end
