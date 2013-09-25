class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			render text: "Terimakasih, kmu akan mendapatkan SMS verifikasi"

			client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
      
      # Create and send an SMS message
      client.account.sms.messages.create(
        from: TWILIO_CONFIG['from'],
        to: @user.phone,
        body: "Thanks for signing up. To verify your account, please reply HELLO to this message.")
		else
		render new	
			
		end
	end

end
