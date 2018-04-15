class Api::V1::Users::PhotographersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :only => [:index], :raise => false

  def index
    begin
      @photographers = Photographer.where(approve: true).limit(40)
      render json: @photographers.as_json(:except =>[:created_at, :updated_at], :include => [:user]), status: 200
    rescue
      render json: "-2", status: 200
    end
  end

  def create
    begin
      @user = User.find_by_email(params[:user_email])
      if @user.role == 0 && (@user.vendor_role == 0 || @user.vendor_role == 2)
        @photographer = Photographer.new
        @photographer.image1 = params[:image1]
        @photographer.image2 = params[:image2]
        @photographer.image3 = params[:image3]
        @photographer.name = params[:name]
        @photographer.description = params[:description]
        @photographer.equipments = params[:equipments]
        @photographer.city = params[:city]
        @photographer.mayo = params[:mayo].to_i
        @photographer.mehndi = params[:mehndi].to_i
        @photographer.barat = params[:barat].to_i
        @photographer.walima = params[:walima].to_i
        @photographer.party = params[:party].to_i
        @photographer.other = params[:other].to_i

        @user.vendor_role = 2
        @photographer.user_id = @user.id
        @user.save

        if @photographer.save
          render json: @photographer.as_json(:except =>[:created_at, :updated_at, :user_id], :include => [:user]), status: 200
        else
          render json: {:errors => @photographer.errors.full_messages}, status: 200
        end
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end

  def manager_params
    params.require(:photographer).permit(:image1, :image2, :image3, :name, :description, :equipments, :city, :mayo, :mehndi, :barat, :walima, :party, :other, :user_id)
  end
end
