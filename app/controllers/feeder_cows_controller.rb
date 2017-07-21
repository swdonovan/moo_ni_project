class FeederCowsController < ApplicationController

  def index
    @feeder_cows = FeederCow.all
  end
end
