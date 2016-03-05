class ManuscriptsController < ApplicationController

  before_action :authenticate_user!

  def index
    @manuscripts = Manuscript.all
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
  end

  def edit
    @manuscript = Manuscript.find(params[:id])
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
