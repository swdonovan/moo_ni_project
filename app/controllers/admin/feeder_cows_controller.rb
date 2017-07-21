class Admin::FeederCowsController < Admin::AdminController

  def index
    @feeder_cows = FeederCow.all
  end

  def new
    @feeder_cow = FeederCow.new
  end

  def create
    @feeder_cow = FeederCow.new(feeder_params)
    if @feeder_cow.save
      flash[:notice] = "Feeder Cow #{@feeder_cow.tag_number} created"
      redirect_to feeder_cows_path
    else
      flas[:notice] = "Try again #{current_user.name}"
      render :new
    end
  end

  def edit

  end

  def destroy
    @feeder_cow.destroy
  end

  def dead
    @feeder_cow.dead!
  end

  private

  def feeder_params
    byebug
    params.require(:feeder_cow).permit(:tag_number, :residence_id, :weight, :transaction_id, :life_status)
  end

  def set_feeder_cow_id
    @feeder_cow = FeederCow.find(params[:id])
  end

  def set_feeder_cow_tag_number
    @feeder_cow = FeederCow.where(params[:tag_number])
  end
end
