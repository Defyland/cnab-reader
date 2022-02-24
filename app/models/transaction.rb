class Transaction < ApplicationRecord
  belongs_to :store
  enum type_of_transaction: [:debito, :boleto, :financiamento, :credito, :emprestimo, :vendas, :ted, :doc, :aluguel]

  #Hora da ocorrência atendendo ao fuso de UTC-3
  def date_with_fuso
    self.datetime_of_transaction.to_datetime.new_offset("-03:00")
  end
  
end
