class TechniciansController < ApplicationController

  def show
    @technician = Technician.find(params[:id])
    @movies_worked = @technician.movie_technicians
  end

  def index
    @search = Technician.search(params[:q])
    @technicians = @search.result.page(params[:page]).per(6)
  end
end
