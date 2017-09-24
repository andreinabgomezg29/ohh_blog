class VisitsController < ApplicationController
  def index
    @visits = Visit.all
  end
  
  def show
    @visit = Visit.find(params[:id])
  end
end
