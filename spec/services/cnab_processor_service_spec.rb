require 'rails_helper'

describe "Cnab processor service" do
  context "when a new file is imported" do
    let(:file) { fixture_file_upload('files/CNAB.txt', 'text/plain') } 

    before { allow(Cnab::ProcessorService).to receive(:new) }
    
    before { Cnab::ProcessorService.new(file) } 
    
    it ".receive file" do
      expect(Cnab::ProcessorService).to have_received(:new).with(file)
    end
  end
end

describe "Blu Cnab service" do
  context "when receive a new file" do
    let(:file) { fixture_file_upload('files/CNAB.txt', 'text/plain') } 
    
    before { allow(Cnab::BluCnabService).to receive(:new) }
    
    let(:blu_cnab) { Cnab::BluCnabService.new(file) }

    it ".instance with file" do
      blu_cnab
      expect(Cnab::BluCnabService).to have_received(:new).with(file)
    end

  end
  
end
