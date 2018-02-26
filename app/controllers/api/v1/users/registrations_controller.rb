class Api::V1::Users::RegistrationsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, :only => [:create], :raise => false

	def create
		begin
      #debugger
			email = params[:email]
			password = params[:password]
			password_confirmation = params[:password_confirmation]
			user_name = params[:name]
      cnic = params[:cnic]
			number = params[:number]
			cv = params[:cv].to_i
			if password == password_confirmation
        #debugger
				@user = User.new
				@user.email = email
				@user.password = password
				@user.password_confirmation = password_confirmation
        @user.role = cv
        if cv == 1
          @user.approve = true
        else
          @user.approve = false
        end
        #debugger
				if @user.save
					if cv == 0
						@vendor = Vendor.new
						@vendor.name = user_name
						@vendor.cnic = cnic
						@vendor.number = number
						@vendor.image = ""
						@vendor.user_id = @user.id
						if @vendor.save
							render json: @user.as_json(:except =>[:created_at, :updated_at], :include => [:vendor]), status: 200
						else
							render json: {:errors => @vendor.errors.full_messages.as_json()}, status: 200
						end
					elsif cv == 1
						@customer = Customer.new
						@customer.name = user_name
						@customer.cnic = cnic
						@customer.number = number
						@customer.image = ""
						@customer.user_id = @user.id
						if @customer.save
							render json: @user.as_json(:except =>[:created_at, :updated_at], :include => [:customer]), status: 200
						else
							render json: {:errors => @customer.errors.full_messages.as_json()}, status: 200
						end
					end
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
end
