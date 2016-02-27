class ManuscriptsController < ApplicationController

  def index
    @manuscripts = Manuscript.all
  end

  def new
    @manuscript = Manuscript.new
  end

  def create
    Manuscript.create(manuscript_params)
    redirect_to '/manuscripts'
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


# Utility method to explicitly state params accepted by controller

  def manuscript_params
    params.require(:manuscript).permit(:title, :author, :journal)
  end

end
