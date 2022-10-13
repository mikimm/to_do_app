class TasksController < ApplicationController
  def index
    @tasks=Task.all
  end

  def new
    @task_memo = TaskMemo.new
  end


  def create
    task_memo =  TaskMemo.new(task_params)
    if task_memo.valid?
      task_memo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    load_task

    @task_memo = TaskMemo.new(task: @task_memo)
  end

  def edit
    load_task

    @task_memo = TaskMemo.new(task: @task_memo)

  end

  def update
    load_task

    @form = TaskMemo.new(task_params, task: @task_memo)

    if @form.save
      redirect_to @task_memo, notice: 'The post has been updated.'
    else
      render :edit
    end
  end




  def destroy
    @task= Task.find(params[:id])
    redirect_to root_path if @task.destroy
  end


  private

  def task_params
    params.require(:task).permit(:title,:url,:region,:phone_number,:ceo,:content).merge(user_id: current_user.id)
  end


  def load_task
    @task_memo = current_user.tasks.find(params[:id])
  end
  

end

