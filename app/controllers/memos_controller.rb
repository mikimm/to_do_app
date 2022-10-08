class MemosController < ApplicationController
    def index
        @memos = Memo.all
    end

    def new
        @task = Task.find(params[:task_id])
        @memo = Memo.new
    end

    def create
        @task = Task.find(params[:task_id])
        @memo = Memo.new(memo_params)
        if @memo.save
          redirect_to root_path
        else
          render 'new'
        end
      end

    def show
    end

    def edit
    end

    private

    def memo_params
      params.require(:memo).permit(:url,:region,:phone_number,:CEO,:content).merge(user_id: current_user.id,task_id: @task.id)
    end
end
