module Cnab

  class BaseCnabService
    def initialize(cnab)
      @cnab = cnab
      read_lines_from_file
    end

    def normalize_data_from_line(line)
    end

    private
    # Import
    def read_lines_from_file
      File.foreach(@cnab.tempfile) { |line| normalize_data_from_line(line.chomp) }
    end

  end
end
