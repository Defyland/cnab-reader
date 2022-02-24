class StoresController < ApplicationController
  
  def index  
    @stores = Store.all
  end
  
  def show
    @store =  Store.find(params[:id])
    @transactions = @store.transactions.order(datetime_of_transaction: :asc)
  end

  private

  def stores_params
    params.require(:store).permit(:id)
  end
end
