class AdoptionsController < ApplicationController
  belongs_to :owner
  belongs_to :dog
end
