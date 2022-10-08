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
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

  def edit  
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title).merge(user_id: current_user.id)
  end
end
