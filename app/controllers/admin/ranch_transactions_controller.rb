class Admin::RanchTransactionsController < Admin::AdminController

  def index
    @ranch_transactions = RanchTransaction.all
    @company = Company.find(params[:id]) if params[:company_id]
  end

  def new
    @companies = Company.all unless params[:company_id]
    @company = Company.find(params[:company_id]) if params[:company_id]
    @ranch_transaction = RanchTransaction.new
  end

  def create
    @ranch_transaction = RanchTransaction.new(ranch_transaction_params)
    if @ranch_transaction.save
      flash[:notice] = "New transaction created"
      redirect_to admin_ranch_transactions_path
    else
      render :new
    end
  end

  private
  def ranch_transaction_params
    params.require(:ranch_transaction).permit(:company_id, :amount, :transaction_type)
  end

end
