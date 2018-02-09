class Api::V1::Users::SessionsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :only => [:create, :destroy], :raise => false

    def create
  		begin
  			email = params[:email]
  			password = params[:password]
        @u = User.find_by_email(email)
        if @u && @u.valid_password?(password)
          render json: @u.as_json(:except =>[:created_at, :updated_at], :include => [:customer]), status: 201
        else
          render json: "-1"
        end
      rescue
        render json: "-2"
      end
    end

    def destroy
      begin
        email = params[:user_email]
        token = params[:user_token]
        @u = User.find_by_email(email)
        if @u && @u.authentication_token == token
          @u.authentication_token = nil
          @u.save
          render json: "1"
        else
          render json: "-1"
        end
      rescue
        render json: "-2"
      end
    end
end
