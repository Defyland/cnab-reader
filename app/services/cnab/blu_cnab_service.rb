module Cnab

  class BluCnabService < BaseCnabService
    

    def normalize_data_from_line line
      @line = line
      normalize_store = save_store
      normalize_customer = save_customer
      return true if normalize_store && normalize_customer
    end
    
    private

    def save_store
      begin
        @store = Store.find_or_create_by!(name: rules_cnab(:name), representative: rules_cnab(:representative))
        save_transaction if @store
      rescue ActiveRecord::RecordInvalid => invalid
        puts invalid.record.errors
      end
    end
    
    def save_transaction
      begin
        transaction = Transaction.where(
          card: rules_cnab(:card), 
          cpf: rules_cnab(:cpf), 
          value: rules_cnab(:balance), 
          datetime_of_transaction: rules_cnab(:datetime_of_transaction),
          type_of_transaction: rules_cnab(:type_of_transaction)[:type],
          store_id: @store.id
        )
        
        if transaction.empty?
          transaction = Transaction.create!(
            card: rules_cnab(:card), 
            cpf: rules_cnab(:cpf), 
            value: rules_cnab(:balance), 
            datetime_of_transaction: rules_cnab(:datetime_of_transaction),
            type_of_transaction: rules_cnab(:type_of_transaction)[:type],
            store_id: @store.id
          )
          update_balance(transaction, rules_cnab(:type_of_transaction)[:nature])
        end
      rescue ActiveRecord::RecordInvalid => invalid
        puts invalid.record.errors
      end
    end

    def update_balance transaction, nature
      if @store
        types = {
          entry:  (@store.balance + transaction.value),
          exit:   (@store.balance - transaction.value)
        }
        new_balance = types[nature]
        begin
          @store.update!(balance: new_balance)
        rescue => exception
          puts exception
        end
      end
    end

    def save_customer
      begin   
        customer = Customer.find_or_create_by!(cpf: rules_cnab(:cpf))
        save_customer_card(customer) if customer
      rescue ActiveRecord::RecordInvalid => invalid
        puts invalid.record.errors
      end
    end
    
    def save_customer_card customer
      begin
        card = CustomerCard.find_or_create_by!(card_number: rules_cnab(:card), customer_id: customer.id)
        card
      rescue ActiveRecord::RecordInvalid => invalid
        puts invalid.record.errors
      end
    end

    # Rules CNAB
    def rules_cnab type
      rules = {
        type_of_transaction: rules_type_of_transaction(@line[0]),
        balance: @line[9..18].to_i / 100.00, #O valor encontrado no arquivo precisa ser divido por cem(valor / 100.00) para normalizá-lo.
        cpf: @line[19..29],
        card: @line[30..41],
        representative: @line[48..61].strip,
        name: @line[62..80].strip,
        datetime_of_transaction: DateTime.parse("".concat(@line[1..8], @line[42..47])),
      }
      rules[type]
    end
    
    # Rules of type of transactions
    def rules_type_of_transaction type
      types = {
        "1": {type: :debito, nature: :entry},
        "2": {type: :boleto, nature: :exit},
        "3": {type: :financiamento, nature: :exit},
        "4": {type: :credito, nature: :entry},
        "5": {type: :emprestimo, nature: :entry},
        "6": {type: :vendas, nature: :entry},
        "7": {type: :ted, nature: :entry},
        "8": {type: :doc, nature: :entry},
        "9": {type: :aluguel, nature: :exit},
      }
      types[:"#{type}"]
    end
  end
end
