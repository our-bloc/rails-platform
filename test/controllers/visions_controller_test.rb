require 'test_helper'

class VisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vision = visions(:one)
  end

  test "should get index" do
    get visions_url
    assert_response :success
  end

  test "should get new" do
    get new_vision_url
    assert_response :success
  end

  test "should create vision" do
    assert_difference('Vision.count') do
      post visions_url, params: { vision: { dreamjob: @vision.dreamjob, industry: @vision.industry, style: @vision.style, ten: @vision.ten } }
    end

    assert_redirected_to vision_url(Vision.last)
  end

  test "should show vision" do
    get vision_url(@vision)
    assert_response :success
  end

  test "should get edit" do
    get edit_vision_url(@vision)
    assert_response :success
  end

  test "should update vision" do
    patch vision_url(@vision), params: { vision: { dreamjob: @vision.dreamjob, industry: @vision.industry, style: @vision.style, ten: @vision.ten } }
    assert_redirected_to vision_url(@vision)
  end

  test "should destroy vision" do
    assert_difference('Vision.count', -1) do
      delete vision_url(@vision)
    end

    assert_redirected_to visions_url
  end
end
