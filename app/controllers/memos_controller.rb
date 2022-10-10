class MemosController < ApplicationController
    def index
    end

    def new
    end

    def create
    end

    def show
      @memo= Memo.find(params[:id])
    end

    def edit
    end

    private

    def memo_params
      params.require(:memo).permit(:url,:region,:phone_number,:ceo,:content).merge(user_id: current_user.id,task_id: @task.id)
    end
end
