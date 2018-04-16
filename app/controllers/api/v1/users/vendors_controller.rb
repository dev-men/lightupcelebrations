class Api::V1::Users::VendorsController < ApplicationController
  def index
    begin
      @user = User.find_by_email(params[:user_email])
      if @user
        @vendor_role = @user.vendor_role
        @vendors = []
        if @vendor_role == 1
          @vendors = @user.hall_managers.where(approve: true)
        elsif @vendor_role == 2
          @vendors = @user.photographers.where(approve: true)
        elsif @vendor_role == 3
          @vendors = @user.decorators.where(approve: true)
        elsif @vendor_role == 4
          @vendors = @user.marquees.where(approve: true)
        end
        render json: @vendors.as_json(:except =>[:created_at, :updated_at, :approve, :user_id], :include => [:user]), status: 200
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end

  def unapproved
    begin
      @user = User.find_by_email(params[:user_email])
      if @user
        @vendor_role = @user.vendor_role
        @vendors = []
        if @vendor_role == 1
          @vendors = @user.hall_managers.where(approve: false)
        elsif @vendor_role == 2
          @vendors = @user.photographers.where(approve: false)
        elsif @vendor_role == 3
          @vendors = @user.decorators.where(approve: false)
        elsif @vendor_role == 4
          @vendors = @user.marquees.where(approve: false)
        end
        render json: @vendors.as_json(:except =>[:created_at, :updated_at, :approve, :user_id], :include => [:user]), status: 200
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end
end
