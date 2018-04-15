class Api::V1::Users::VendorsController < ApplicationController
  def index
    begin
      @user = User.find_by_email(params[:user_email])
      if @user
        @vendor_role = @user.vendor_role
        @vendors = []
        if @vendor_role == 1
          @vendors = @user.hall_managers
        elsif @vendor_role == 2
          @vendors = @user.photograpers
        elsif @vendor_role == 3
          @vendors = @user.decorators
        elsif @vendor_role == 4
          @vendors = @user.marquees
        end
        render json: @vendors.as_json(:except =>[:created_at, :updated_at, :approve, :user_id]), status: 200
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end
end
