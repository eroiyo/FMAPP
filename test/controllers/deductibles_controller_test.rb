# frozen_string_literal: true

require 'test_helper'

class DeductiblesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get deductibles_index_url
    assert_response :success
  end

  test 'should get show' do
    get deductibles_show_url
    assert_response :success
  end

  test 'should get create' do
    get deductibles_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get deductibles_destroy_url
    assert_response :success
  end
end
