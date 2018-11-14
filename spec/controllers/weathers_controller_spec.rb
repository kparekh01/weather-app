require 'rails_helper'

RSpec.describe WeathersController, type: :controller do
  #write tests for controller
  #test post action by inputing a zipcode params
  #set variables for details and weather
  #test that the keys in the response are what we are expecting in each variable
  #test that the location is correctly set
  #test that the lat long coordinates infact do belong to the region as we are pasing those to the dark sky api
  #make sure to sanitize the input from the user
  #validate the zipcode with numericality
  
  describe '#post' do
    it 'renders view with the current, high and low temperatures for the day' do
      post :post, params: {zipcode: '11435'} #zipcode in Briarwood, NY



    end
  end
end
