class TasksController < ApplicationController
  def index
    @tasks=Task.all
  end

  def new
    @task_memo = TaskMemo.new
  end

  def show
    @memo= Memo.find(params[:id])
    @task= Task.find(params[:id])
  end

  def edit
    @memo= Memo.find(params[:id])
    @task= Task.find(params[:id])
  end

  def create
    @task_memo =  TaskMemo.new(task_params)
    if @task_memo.valid?
      @task_memo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @task= Task.find(params[:id])
    redirect_to root_path if @task.destroy
  end


  private

  def task_params
    params.require(:task_memo).permit(:title,:url,:region,:phone_number,:ceo,:content).merge(user_id: current_user.id)
  end
  end
