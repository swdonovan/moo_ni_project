class Admin::CompaniesController < Admin::AdminController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "Company #{@company.name} was created"
      redirect_to admin_company_path(@company)
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name, :city, :state)
  end
end
