class Api::ApplicationController < ApplicationController
  # disable authenticity token
  skip_before_action :verify_authenticity_token
end
