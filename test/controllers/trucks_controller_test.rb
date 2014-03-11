require 'test_helper'

describe TrucksController do
  it "shows a truck" do
    truck = FactoryGirl.create(:truck)
    get :show, truck_slug: truck.slug
    response.success?.must_equal true
  end

  it 'assigns the truck to a variable' do
    truck = FactoryGirl.create :truck
    get :show, truck_slug: truck.slug
    assigns(:truck).must_equal truck
  end
end

