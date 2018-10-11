require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get docs" do
    get :docs
    assert_response :success
  end

  test "should get marketing" do
    get :marketing
    assert_response :success
  end

  test "should get references" do
    get :references
    assert_response :success
  end

  test "should get articles" do
    get :articles
    assert_response :success
  end

  test "should get training" do
    get :training
    assert_response :success
  end

end
