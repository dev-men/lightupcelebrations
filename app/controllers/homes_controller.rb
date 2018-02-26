class HomesController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :raise => false
  before_action :authenticate_admin!

  def index
    @u = 0
    @v = 0
    @c = 0
    @unapproved = 0
    @approved = 0
    @u = User.all.count
    @v = Vendor.all.count
    @c = Customer.all.count
    @unapproved = User.where(role: 0, approve: false).count
    @approved = User.where(role: 0, approve: true).count
  end
end
