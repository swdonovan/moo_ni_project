class CalvingCowsController < ApplicationController
  def index
    @calving_cows = CalvingCow.all
  end
end
