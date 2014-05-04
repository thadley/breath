class UsersController < ApplicationController

def edit
    @user = User.find(params[:id])
end

def update
    @user = User.find(params[:id])
    if current_user.update_attributes(params[:phone_number])
        SmsVerificationMailer.sms_verification_email(@user).deliver
        flash[:notice] = "A verification code has been sent to your phone"
    else
        flash[:error] = "There was an error. Please try again."
        redirect_to :back
    end

    if current_user.update_attributes(user_params)
        flash[:notice] = "User information updated"
        redirect_to root_url
    else
        flash[:error] = "There was an error. Please try again."
        redirect_to :back
    end
end

def verify_sms
    @user = current_user
    if current_user.update_attributes(params[:sms_verified])
        flash[:notice] = "Your phone number is confirmed."
        redirect_to root_path
    else
        flash[:error] = "There was an error. Please try again."
        redirect_to :back
    end
end

private

def user_params
    params.require(:user).permit(:email, :phone_number, :carrier, :send_email, :send_sms, :sms_verification_code, :sms_verification_code_conf, :sms_verified)
end

end