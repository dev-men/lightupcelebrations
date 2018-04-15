class VendorsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :raise => false
  before_action :authenticate_admin!

  def index
    @vendors = User.where(role: 0).order('created_at DESC').paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @vendor = User.find(params[:id])
  end

  def approve_vendor
    if params[:vendor_role] != nil
      @vendor_role = params[:vendor_role].to_i
      if @vendor_role == 1
        @vendor = HallManager.find(params[:id])
      elsif @vendor_role == 2
        @vendor = Photographer.find(params[:id])
      elsif @vendor_role == 3
        @vendor = Decorator.find(params[:id])
      elsif @vendor_role == 4
        @vendor = Marquee.find(params[:id])
      end

      @vendor.approve = true
      if @vendor.save
        flash[:notice] = "Vendor Profile Approved Successfully"
      else
        flash[:alert] = "Vendor Profile Not Approved"
      end
      if @vendor_role == 1
        redirect_to hall_managers_vendors_path
      elsif @vendor_role == 2
        redirect_to photographers_vendors_path
      elsif @vendor_role == 3
        redirect_to decorators_vendors_path
      elsif @vendor_role == 4
        redirect_to marquee_vendors_path
      end
    else
      flash[:alert] = "Wrong Route"
      redirect_to root_path
    end
  end

  def hall_managers
    @managers = HallManager.where(approve: true).order('created_at DESC').paginate(:page => params[:page], :per_page => 15)
  end

  def unapproved_hall_managers
    @managers = HallManager.where(approve: false).order('created_at DESC').paginate(:page => params[:page], :per_page => 15)
  end

  def photographers
    @photograpers = Photographer.where(approve: true).order('created_at DESC').paginate(:page => params[:page], :per_page => 15)
  end

  def unapproved_photographers
    @photograpers = Photographer.where(approve: false).order('created_at DESC').paginate(:page => params[:page], :per_page => 15)
  end

  def decorators
    @decorators = Decorator.where(approve: true).order('created_at DESC').paginate(:page => params[:page], :per_page => 15)
  end

  def unapproved_decorators
    @decorators = Decorator.where(approve: false).order('created_at DESC').paginate(:page => params[:page], :per_page => 15)
  end

  def marquee
    @marquees = Marquee.where(approve: true).order('created_at DESC').paginate(:page => params[:page], :per_page => 15)
  end

  def unapproved_marquee
    @marquees = Marquee.where(approve: false).order('created_at DESC').paginate(:page => params[:page], :per_page => 15)
  end

end
