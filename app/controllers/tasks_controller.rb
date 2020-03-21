class TasksController < ApplicationController
    def new
    end
    def create
        @task = Task.new(params.require(:task).permit(:description, :status))
        @task.save #salva no banco a tarefa que criamos
        redirect_to root_path
    end
    def edit
        #utilizando o params para verificar o routes
        @task = Task.find(params[:id])
    end
    def update
        #toda vez precisamos identificar qual obejto estamos lidando pois toda vez que a action encerra essa informacao e perdida
        @task = Task.find(params[:id]) 
        #o rails ja nos entrega um metodo para update
        @task.update(params.require(:task).permit(:description, :status))
        redirect_to root_path
    end
    def destroy
        task = Task.find(params[:id]) #nao precisa de @ pois não vai ter view
        task.destroy #destroi a tarefa encontrada
        redirect_to root_path
    end  
end