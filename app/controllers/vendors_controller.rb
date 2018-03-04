class VendorsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :raise => false
  before_action :authenticate_admin!

  def index
    @vendors = User.where(role: 0)
  end

  def approved
    @approved = User.where(role: 0, approve: true)
  end

  def unapproved
    @unapproved = User.where(role: 0, approve: false)
  end

  def show
    @vendor = User.find(params[:id])
  end

  def update
    #debugger
    @user = User.find(params[:id])
    @user.approve = true
    if @user.save
      flash[:notice] = "Vendor Profile Approved Successfully"
    else
      flash[:alert] = "Vendor Profile Not Approved"
    end
    redirect_to vendors_path
  end
end
