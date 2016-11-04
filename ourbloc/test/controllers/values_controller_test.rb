require 'test_helper'

class ValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @value = values(:one)
  end

  test "should get index" do
    get values_url
    assert_response :success
  end

  test "should get new" do
    get new_value_url
    assert_response :success
  end

  test "should create value" do
    assert_difference('Value.count') do
      post values_url, params: { value: { howserve: @value.howserve, legacy: @value.legacy, whoserve: @value.whoserve } }
    end

    assert_redirected_to value_url(Value.last)
  end

  test "should show value" do
    get value_url(@value)
    assert_response :success
  end

  test "should get edit" do
    get edit_value_url(@value)
    assert_response :success
  end

  test "should update value" do
    patch value_url(@value), params: { value: { howserve: @value.howserve, legacy: @value.legacy, whoserve: @value.whoserve } }
    assert_redirected_to value_url(@value)
  end

  test "should destroy value" do
    assert_difference('Value.count', -1) do
      delete value_url(@value)
    end

    assert_redirected_to values_url
  end
end
