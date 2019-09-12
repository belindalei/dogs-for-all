# require 'test_helper'
require './test/test_helper'
# require_relative '../spec_helper.rb'

class AdoptionsControllerTest < ActionDispatch::IntegrationTest
  test '#destroy' do

    context 'when adoption is found' do
      it 'responds with 200'
      it 'shows the adoption'
    end

    context 'when adoption is not found' do
      it 'responds with 404'
    end

  end
end
