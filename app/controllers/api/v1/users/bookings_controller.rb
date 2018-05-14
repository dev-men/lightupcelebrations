class Api::V1::Users::BookingsController < ApplicationController
  def index
  end

  def show
  end

  def create
    begin
      @user = User.find_by_email(params[:user_email])
      if @user.role == 1
        #@t = params[:start].to_time
        #render json: @t, status: 200
        @b = Booking.new
        @role = params[:vendor_role].to_i
        @b.user_id = @user.id
        @b.imageable_id = params[:imageable_id].to_i
        if @role == 1
          @b.imageable_type = "HallManager"
        elsif @role == 2
          @b.imageable_type = "Photographer"
        elsif @role == 3
          @b.imageable_type = "Decorator"
        elsif @role == 4
          @b.imageable_type = "Marquee"
        end
        @b.day = params[:day]
        @b.start = params[:start]
        @b.end = params[:end]
        @b.location = params[:location]
        if @b.save
          render json: @b.as_json(:except =>[:created_at, :updated_at, :user_id]), status: 200
        else
          render json: {:errors => @b.errors.full_messages}, status: 200
        end
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end
end
