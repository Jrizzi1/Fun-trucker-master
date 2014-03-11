require 'test_helper'

class TruckSlugsAreKingsTest < ActionDispatch::IntegrationTest
  test "A truck can be viewed by it's link" do
    truck = FactoryGirl.create(:truck)

    get truck.link
    assert_response :success
    assert_equal assigns(:truck), truck
  end

  test "A rally can be viewed by it's link" do
    rally = FactoryGirl.create(:rally)

    get rally.link
    assert_response :success
    assert_equal assigns(:rally), rally
  end

  test "A rally and a truck cannot share a slug" do
    slug = "my/favorite/slug"

    truck = FactoryGirl.create(:truck, slug: slug)
    rally = FactoryGirl.create(:rally, slug: slug)
    rally.wont_be :valid?
    rally.errors.must_include(:slug)
  end
end

