require 'test_helper'
class RoutesTest < ActionDispatch::IntegrationTest
  test "it routes the root to the index" do
    assert_routing '/', {controller: "home", action: "index"}
  end

  test 'it routes to the admin:trucks index' do
    assert_routing '/admin/trucks', {controller: 'admin/trucks', action: 'index'}
  end
end

