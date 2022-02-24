require 'rails_helper'

RSpec.describe StoresController, type: :controller do

  describe "GET #index" do
    subject(:response) { get :index }

    it "renders the index template" do
      expect(response).to render_template(:index)
      expect(response).to render_template("index")
    end
  end
end
