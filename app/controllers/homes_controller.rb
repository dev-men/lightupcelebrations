class HomesController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :raise => false
  before_action :authenticate_admin!

  def index
    @u = 0
    @v = 0
    @c = 0
    @unapproved = 0
    @approved = 0
    @managers = 0
    @photograpers = 0
    @decorators = 0
    @marquees = 0

    @u = User.all.count
    @c = User.where(role: 1).count
    @v = User.where(role: 0).count
    @unapproved = User.where(role: 0, approve: false).count
    @approved = User.where(role: 0, approve: true).count
    @managers = HallManager.all.count
    @photograpers = Photographer.all.count
    @decorators = Decorator.all.count
    @marquees = Marquee.all.count
  end
end
