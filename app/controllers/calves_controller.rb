class CalvesController < ApplicationController
  def index
    @calves = Calf.all
  end
end
