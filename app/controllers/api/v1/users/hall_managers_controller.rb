class Api::V1::Users::HallManagersController < ApplicationController
  def index
    begin
      @halls = HallManager.all
      render json: @halls.as_json(:except =>[:created_at, :updated_at], :include => [:vendor]), status: 201
    rescue
      render json: "-2"
    end
  end

  def create
    begin
      @user = User.find_by_email(params[:user_email])
      if @user.role == 0
        @vendor = @user.vendor
        @manager = HallManager.new(manager_params)
        @manager.vendor_id = @vendor.id
        if @manager.save
          render json: @manager.as_json(:except =>[:created_at, :updated_at], :include => [:vendor]), status: 201
        else
          render json: @manager.errors.full_messages
        end
      else
        render json: "-1"
      end
    rescue
      render json: "-2"
    end
  end

  def manager_params
    params.require(:hall_manager).permit(:image1, :image2, :image3, :image4, :image5, :image6, :line1, :line2, :number, :city, :budget, :guest, :vendor_id)
  end
end
