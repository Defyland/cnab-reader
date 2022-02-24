class TransactionsController < ApplicationController
  def index
  end

  def import_cnab
    import = Cnab::ProcessorService.new(transactions_params[:cnab_file])
    redirect_to stores_path
  end

  private

  def transactions_params
    params.require(:transaction).permit(:cnab_file, :type)
  end
  
end
