class Api::V1::Users::MarqueesController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :only => [:index], :raise => false

  def index
    begin
      @halls = Marquee.where(approve: true).limit(40)
      render json: @halls.as_json(:except =>[:created_at, :updated_at], :include => [:user]), status: 200
    rescue
      render json: "-2", status: 200
    end
  end

  def create
    begin
      @user = User.find_by_email(params[:user_email])
      if @user.role == 0 && (@user.vendor_role == 0 || @user.vendor_role == 4)
        @manager = Marquee.new
        @manager.image1 = params[:image1]
        @manager.image2 = params[:image2]
        @manager.image3 = params[:image3]
        @manager.marquee_name = params[:marquee_name]
        @manager.numbe_of_marquee = params[:numbe_of_marquee].to_i
        @manager.address_line_1 = params[:address_line_1]
        @manager.address_line_2 = params[:address_line_2]
        @manager.city = params[:city]
        @manager.budget_per_head = params[:budget_per_head].to_i
        @manager.guest_capacity = params[:guest_capacity].to_i
        @user.vendor_role = 4
        @manager.user_id = @user.id
        @user.save

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
end
