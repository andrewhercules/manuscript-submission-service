class ManuscriptsController < ApplicationController

  before_action :authenticate_user!

  def index
    @my_manuscripts = Manuscript.where(:user_id => current_user.id)
    @manuscripts_for_approval = Manuscript.where(:vpr_approval => false)
  end

  def new
    @manuscript = Manuscript.new
  end

  def create
    @manuscript = Manuscript.new(manuscript_params)
    @manuscript.user_id = current_user.id
    @manuscript.save
    flash[:notice] = 'Manuscript successfully saved!'
    redirect_to manuscripts_path
  end

  def show
    @manuscript = Manuscript.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to manuscripts_path, :flash => { :notice => 'Unfortunately, you cannot access this manuscript!' }
  end

  def edit
    @manuscript = current_user.manuscripts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to manuscripts_path, :flash => { :notice => 'Unfortunately, you cannot edit this manuscript!' }
  end

  def update
    @manuscript = Manuscript.find(params[:id])
    @manuscript.update(manuscript_params)
    redirect_to '/manuscripts'
  end

  def destroy
    @manuscript = Manuscript.find(params[:id])
    @manuscript.destroy
    flash[:notice] = 'Manuscript successfully deleted'
    redirect_to '/manuscripts'
  end


# Utility method to explicitly state params accepted by controller

  def manuscript_params
    params.require(:manuscript).permit(:title, :author, :journal, :document)
  end

end
