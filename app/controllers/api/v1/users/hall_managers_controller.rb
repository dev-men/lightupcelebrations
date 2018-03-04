class Api::V1::Users::HallManagersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :only => [:index], :raise => false

  def index
    begin
      @halls = HallManager.all
      render json: @halls.as_json(:except =>[:created_at, :updated_at, :user_id], :include => [:user]), status: 200
    rescue
      render json: "-2", status: 200
    end
  end

  def create
    begin
      @user = User.find_by_email(params[:user_email])
      if @user.role == 0
        #@manager = HallManager.new(manager_params)
        @manager = HallManager.new
        @manager.image1 = params[:image1]
        @manager.image2 = params[:image2]
        @manager.image3 = params[:image3]
        @manager.image4 = params[:image4]
        @manager.image5 = params[:image5]
        @manager.image6 = params[:image6]
        @manager.hall_name = params[:hall_name]
        #@manager. = params[:]
        #@manager. = params[:]
        #@manager. = params[:]
        #@manager. = params[:]
        #@manager. = params[:]
        #@manager. = params[:]
        @user.vendor_role = 1
        @user.save
        @manager.user_id = @user.id
        if @manager.save
          render json: @manager.as_json(:except =>[:created_at, :updated_at, :user_id], :include => [:user]), status: 200
        else
          render json: {:errors => @manager.errors.full_messages}, status: 200
        end
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end

  def manager_params
    params.require(:hall_manager).permit(:image1, :image2, :image3, :image4, :image5, :image6, :hall_name, :number_of_halls, :address_line_1, :address_line_2, :city, :budget_per_head, :guest_capacity, :user_id)
  end
end
