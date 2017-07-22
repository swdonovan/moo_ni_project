class Admin::CompaniesController < Admin::AdminController

  def index
    @companies = Company.all
  end

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

  def edit
    @company  = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    if @company.save
      redirect_to admin_company_path(@company)
      flash[:success] = "#{@company.name} updated!"
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "#{@company.name} was successfully deleted from your records"
    redirect_to admin_companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :city, :state)
  end
end
