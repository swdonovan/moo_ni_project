class Admin::CalvingCowsController < Admin::AdminController
  before_action :set_transaction, only: :create


  def new
    @calving_cow = CalvingCow.new
  end

  def create
    @calving_cow = @transaction.calving_cows.new(calving_params)
    if @calving_cow.save
      weight = CalvingCowWeight.create(calving_cow_id: @calving_cow.id, weight: params[:weight]).incoming!
      flash[:notice] = "Calving Cow #{@calving_cow.tag_number} created"
      redirect_to calving_cows_path
    else
      flas[:notice] = "Try again #{current_user.name}"
      render :new
    end
  end

  def edit

  end

  def destroy
    @calving_cow.destroy
  end

  def dead
    @calving_cow.dead!
  end

  private

  def set_transaction
    @transaction = RanchTransaction.find(params[:transaction_id])
  end

  def calving_params
    @params = params.permit(:tag_number, :residence_id, :life_status)
    @params[:life_status] = @params[:life_status].to_i
    @params
  end

  def set_calving_cow_id
    @calving_cow = CalvingCow.find(params[:id])
  end

  def set_feeder_cow_tag_number
    @calving_cow = CalvingCow.where(params[:tag_number])
  end
end
