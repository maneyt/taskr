class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.not_completed
    @task = Task.new
  end

  def create
     @task = current_user.tasks.new(task_params)
     @tasks = current_user.tasks

     if @task.save
       redirect_to :tasks
     else
       render :index
     end
  end

  def update
    task= current_user.tasks.find(params[:id])
    task.update_attribute(:complete, true)
    redirect_to :tasks
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to :tasks
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
  end
end
