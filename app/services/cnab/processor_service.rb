module Cnab
  class ProcessorService

    def initialize(cnab, type: :default)
      call_cnab_processor(cnab, type)
    end

    private 

    def call_cnab_processor cnab, type
      cnab_types = {
        default: Cnab::BluCnabService.new(cnab),
        # bradesco: Cnab::BradescoCnabService
        # outros tipos de CNAB
      }
      cnab_types[type]
    end
  end
end