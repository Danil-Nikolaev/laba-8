require 'rails_helper'

RSpec.describe "Calcs", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/calc/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /view" do
    it "returns http success" do
      get "/calc/view"
      expect(response).to have_http_status(:success)
    end
    it 'returns for values 2 and 3 - 1' do
    get "/calc/view", params: {:v1 => '2', :v2 => '3', 'commit' => 'Calc result' }
    expect(controller.instance_variable_get(:@result_1)).to eq(1)
    end
    it 'returns for values 2 and 3 - 6' do
    get "/calc/view", params: {:v1 => '2', :v2 => '3', 'commit' => 'Calc result' }
    expect(controller.instance_variable_get(:@result_2)).to eq(6)
    end
  end
end
