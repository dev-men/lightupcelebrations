class Api::V1::Users::DecoratorsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :only => [:index], :raise => false

  def index
    begin
      @halls = Decorator.where(approve: true).limit(40)
      render json: @halls.as_json(:except =>[:created_at, :updated_at], :include => [:user]), status: 200
    rescue
      render json: "-2", status: 200
    end
  end

  def create
    begin
      @user = User.find_by_email(params[:user_email])
      if @user.role == 0 && (@user.vendor_role == 0 || @user.vendor_role == 3)
        @d = Decorator.new
        @d.image1 = params[:image1]
        @d.image2 = params[:image2]
        @d.image3 = params[:image3]
        @d.address_line_1 = params[:address_line_1]
        @d.address_line_2 = params[:address_line_2]
        @d.city = params[:city]
        @d.compnay_name = params[:company_name]
        @d.theme = params[:theme]
        @d.mayo = params[:mayo].to_i
        @d.mehndi = params[:mehndi].to_i
        @d.barat = params[:barat].to_i
        @d.walima = params[:walima].to_i
        @d.party = params[:party].to_i
        @d.other = params[:other].to_i
        @user.vendor_role = 3
        @d.user_id = @user.id
        @user.save

        if @d.save
          render json: @d.as_json(:except =>[:created_at, :updated_at, :user_id], :include => [:user]), status: 200
        else
          render json: {:errors => @d.errors.full_messages}, status: 200
        end
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end
end
