class Admin::ResidencesController < Admin::AdminController

  def index
    @residences = Residence.all
  end

  def new
    @residence = Residence.new
  end

  def create
    @residence = Residence.new(residence_params)
    if @residence.save
      flash[:notice] = "Residence #{@residence.name} was created"
      redirect_to admin_residence_path(@residence)
    else
      render :new
    end
  end

  def show
    @residence = Residence.find(params[:id])
  end

  def edit
    @residence = Residence.find(params[:id])
  end

  def update
    @residence = Residence.find(params[:id])
    @residence.update(residence_params)
    if @residence.save(residence_params)
      flash[:notice] = "Residence #{@residence.name} updated!"
      redirect_to admin_residence_path(@residence)
    else
      render :edit
    end
  end

  private

  def residence_params
    params.require(:residence).permit(:name, :max_capacity, :image_path)
  end

end
