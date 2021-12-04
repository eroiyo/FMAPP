# frozen_string_literal: true

require 'test_helper'

class DeductibleControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get deductible_index_url
    assert_response :success
  end

  test 'should get show' do
    get deductible_show_url
    assert_response :success
  end

  test 'should get create' do
    get deductible_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get deductible_destroy_url
    assert_response :success
  end
end
