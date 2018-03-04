class CustomersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :raise => false
  before_action :authenticate_admin!

  def index
    @customers = User.where(role: 1)
  end
end
