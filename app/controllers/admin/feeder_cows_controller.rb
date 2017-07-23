class Admin::FeederCowsController < Admin::AdminController
  before_action :set_transaction, only: :create
  before_action :set_feeder_cow_id, only: [:destroy, :edit]

  def new
    @feeder_cow = FeederCow.new
  end

  def create
    @feeder_cow = @transaction.feeder_cows.new(feeder_params)
    if @feeder_cow.save
      weight = FeederWeight.create(feeder_cow_id: @feeder_cow.id, weight: params[:weight]).incoming!
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
    @weight = FeederWeight.where(feeder_cow_id: @feeder_cow)
    @weight.delete_all
    @feeder_cow.destroy
    flash[:notice] = "#{@feeder_cow} Deleted"
    redirect_to feeder_cows_path
  end

  def dead
    @feeder_cow.dead!
  end

  private

  def set_transaction
    @transaction = RanchTransaction.find(params[:transaction_id])
  end

  def feeder_params
    @params = params.permit(:tag_number, :residence_id, :life_status)
    @params[:life_status] = @params[:life_status].to_i
    @params
  end

  def set_feeder_cow_id
    @feeder_cow = FeederCow.find(params[:id])
  end

  def set_feeder_cow_tag_number
    @feeder_cow = FeederCow.where(params[:tag_number])
  end
end
