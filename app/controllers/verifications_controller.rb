class VerificationsController < ApplicationController

	berore_filter :get_user

	def create
		@user.update_attribute(:verified, true)

		head :ok
	end

	private
	def get_user
		unless @user = User.find_by_phone(params['form'])
			head :not_found
		end
	end
end
