require 'test_helper'

class Admin::RalliesControllerTest < ActionController::TestCase
  setup do
    @rally = FactoryGirl.create(:rally)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rallies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rally" do
    @rally = FactoryGirl.build(:rally)

    assert_difference('Rally.count') do
      post :create, rally: { end_at: @rally.end_at, name: @rally.name, slug: @rally.slug, start_at: @rally.start_at }
    end

    assert_redirected_to admin_rally_path(assigns(:rally))
  end

  test "should show rally" do
    get :show, id: @rally
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rally
    assert_response :success
  end

  test "should update admin_rally" do
    patch :update, id: @rally, rally: { end_at: @rally.end_at, name: @rally.name, slug: @rally.slug, start_at: @rally.start_at }
    assert_redirected_to admin_rally_path(assigns(:rally))
  end

  test "should destroy rally" do
    assert_difference('Rally.count', -1) do
      delete :destroy, id: @rally
    end

    assert_redirected_to admin_rallies_path
  end
end
