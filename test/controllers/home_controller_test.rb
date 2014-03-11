require 'test_helper'

describe HomeController do
  it "gets index" do
    get :index
    response.success?.must_equal true
  end
end

