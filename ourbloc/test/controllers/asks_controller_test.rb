require 'test_helper'

class AsksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ask = asks(:one)
  end

  test "should get index" do
    get asks_url
    assert_response :success
  end

  test "should get new" do
    get new_ask_url
    assert_response :success
  end

  test "should create ask" do
    assert_difference('Ask.count') do
      post asks_url, params: { ask: {  } }
    end

    assert_redirected_to ask_url(Ask.last)
  end

  test "should show ask" do
    get ask_url(@ask)
    assert_response :success
  end

  test "should get edit" do
    get edit_ask_url(@ask)
    assert_response :success
  end

  test "should update ask" do
    patch ask_url(@ask), params: { ask: {  } }
    assert_redirected_to ask_url(@ask)
  end

  test "should destroy ask" do
    assert_difference('Ask.count', -1) do
      delete ask_url(@ask)
    end

    assert_redirected_to asks_url
  end
end
