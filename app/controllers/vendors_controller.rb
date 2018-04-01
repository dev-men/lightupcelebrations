class VendorsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :raise => false
  before_action :authenticate_admin!

  def index
    @vendors = User.where(role: 0).order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
  end

  def approved
    @approved = User.where(role: 0, approve: true).order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
  end

  def unapproved
    @unapproved = User.where(role: 0, approve: false).order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @vendor = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.approve = true
    if @user.save
      flash[:notice] = "Vendor Profile Approved Successfully"
    else
      flash[:alert] = "Vendor Profile Not Approved"
    end
    redirect_to vendors_path
  end

  def hall_managers
    @managers = HallManager.order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
  end

  def photographers
    @photograpers = Photographer.order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
  end

  def decorators
    @decorators = Decorator.order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
  end

  def marquee
    @marquees = Marquee.order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
  end

end
