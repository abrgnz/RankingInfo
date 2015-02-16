class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :task_done ,:task_not_done]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @createdTasks = Task.created_today.count
    @myTasks = Task.task_not_done(session[:user_id],session[:user_privileges]).count
  end

  def task_done
    if @task.update_attributes(done: 1)
      respond_to do |format|
        format.html do
          redirect_to tasks_assigned_path
          flash[:success]= 'Tarea Completada'
        end
      end
    end
  end

  def task_not_done
    if @task.update_attributes(done: 0)
      respond_to do |format|
        format.html do
          redirect_to tasks_assigned_path
         flash[:success]= 'Tarea NO Completada'
        end
      end
    end
  end


  def assigned_tasks
    Task.where(user_id: nil).destroy_all
    @unfinishedTasks = Task.task_not_done(session[:user_id],session[:user_privileges])
    @finishedTasks = Task.task_done(session[:user_id],session[:user_privileges]).limit(15)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.done = 0
    respond_to do |format|
      if @task.save
        format.html do
         redirect_to tasks_assigned_path
         flash[:success] ='Task was successfully created.'
       end
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html do
          redirect_to @task
          flash[:success] = 'Actualizada con Exito'
        end
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html do
        redirect_to tasks_url
        flash[:success] = 'Borrada con Exito!'
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:user_id,:description,:title)

    end
end
