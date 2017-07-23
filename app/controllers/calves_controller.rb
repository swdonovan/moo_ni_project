class CalvesController < ApplicationController
  def index
    @calves = Calf.all
  end

  def show
    @calf = Calf.find(params[:id])
    @cow = CalvingCow.find(params[:calving_cow_id])
  end

  def year
    @year = params[:year]
    @calves = Calf.where("created_at >= ? and created_at < ?",
        Time.mktime(@year.to_i, 1), Time.mktime(@year.to_i, 12))
    render :year_index
  end
end
