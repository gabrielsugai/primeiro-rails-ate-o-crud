class TasksController < ApplicationController
    def new
    end
    def create
        @task = Task.new(description: params[:task][:description],
        status: params[:task][:status])
        @task.save #salva no banco a tarefa que criamos
    end
end