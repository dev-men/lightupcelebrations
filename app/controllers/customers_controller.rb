class CustomersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :raise => false
  before_action :authenticate_admin!

  def index
    @customers = User.where(role: 1).order('created_at DESC').paginate(:page => params[:page], :per_page => 15)
  end
end
