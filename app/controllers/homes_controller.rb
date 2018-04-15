class HomesController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :raise => false
  before_action :authenticate_admin!

  def index
    @u = 0
    @v = 0
    @c = 0
    @managers = 0
    @photograpers = 0
    @decorators = 0
    @marquees = 0

    @approved_managers = 0
    @approved_photograpers = 0
    @approved_decorators = 0
    @approved_marquees = 0

    @unapproved_managers = 0
    @unapproved_photograpers = 0
    @unapproved_decorators = 0
    @unapproved_marquees = 0

    @u = User.all.count
    @c = User.where(role: 1).count
    @v = User.where(role: 0).count
    @managers = HallManager.all.count
    @photograpers = Photographer.all.count
    @decorators = Decorator.all.count
    @marquees = Marquee.all.count

    @approved_managers = HallManager.where(approve: true).all.count
    @approved_photograpers = Photographer.where(approve: true).all.count
    @approved_decorators = Decorator.where(approve: true).all.count
    @approved_marquees = Marquee.where(approve: true).all.count

    @unapproved_managers = HallManager.where(approve: false).all.count
    @unapproved_photograpers = Photographer.where(approve: false).all.count
    @unapproved_decorators = Decorator.where(approve: false).all.count
    @unapproved_marquees = Marquee.where(approve: false).all.count
  end
end
