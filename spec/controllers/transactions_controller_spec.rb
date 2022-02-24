require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe "GET #index" do
    subject(:response) { get :index }

    it "renders the index template" do
      expect(response).to render_template(:index)
      expect(response).to render_template("index")
    end
  end

  describe "POST #import_cnab" do
    context "when upload a new cnab" do
      subject(:response) { post :import_cnab, params: {transaction: { cnab_file: fixture_file_upload('files/CNAB.txt', 'text/plain') } } }
      
      it "redirect to stores list" do
        expect(response).to redirect_to '/stores'
      end

    end
  end  
end
