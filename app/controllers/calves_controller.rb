class CalvesController < ApplicationController
  def index
    @calves = Calf.all
  end

  def show
    byebug
    @calf = Calf.find(params[:id])
    @cow = CalvingCow.find(params[:calving_cow_id])
  end
end
