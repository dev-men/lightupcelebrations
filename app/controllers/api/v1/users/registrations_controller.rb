class Api::V1::Users::RegistrationsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :only => [:create, :social], :raise => false

	def create
		begin
			email = params[:email]
			password = params[:password]
			password_confirmation = params[:password_confirmation]
			user_name = params[:name]
      cnic = params[:cnic]
			number = params[:number]
			role = params[:role].to_i
			if password == password_confirmation
				@user = User.new
				@user.email = email
				@user.password = password
				@user.password_confirmation = password_confirmation
        @user.role = role
        @user.name = user_name
        @user.cnic = cnic
        @user.number = number
				if @user.save
          render json: @user.as_json(:except =>[:created_at, :updated_at]), status: 200
				else
					render json: {:errors => @user.errors.full_messages.as_json()}, status: 200
				end
			else
				render json: "-1", status: 200
			end
		rescue
			render json: "-2", status: 200
		end
	end

  def update
    begin
      @user = User.find_by_email(params[:user_email])
      if @user
        @user.name = params[:name]
        #@user.cnic = params[:cnic]
        @user.number = params[:number]
				if @user.save
          render json: @user.as_json(:except =>[:created_at, :updated_at]), status: 200
				else
					render json: {:errors => @user.errors.full_messages.as_json()}, status: 200
				end
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end

  def image_change
    begin
      @user = User.find_by_email(params[:user_email])
      if @user
        @user.image = params[:image]
        if @user.save
          render json: @user.as_json(:except =>[:created_at, :updated_at]), status: 200
        else
          render json: {:errors => @user.errors.full_messages.as_json()}, status: 200
        end
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end

  def password_change
    begin
      @user = User.find_by_email(params[:user_email])
      if @user
        password = params[:password]
        password_confirmation = params[:password_confirmation]
        if @user.valid_password?(params[:old_password]) && password == password_confirmation
          @user.password = password
  				@user.password_confirmation = password_confirmation
          if @user.save
            render json: "1", status: 200
          else
            render json: {:errors => @user.errors.full_messages.as_json()}, status: 200
          end
        else
          render json: "0", status: 200
        end
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end

  def social
    begin
      @u = User.find_by_email(params[:email])
      if @u
        render json: @u.as_json(:except =>[:created_at, :updated_at]), status: 200
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end
end
