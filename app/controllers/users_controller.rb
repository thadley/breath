class UsersController < ApplicationController

def edit
    @user = current_user
end

def update
    if user_params[:phone_number].empty?
        phone_number_changed = nil
    else
        phone_number_changed = user_params[:phone_number] && (current_user.phone_number != user_params[:phone_number].to_i)
    end

    if phone_number_changed == true
        current_user.update_attributes(user_params)
        SmsVerificationMailer.sms_verification_email(current_user).deliver
        flash[:notice] = "A verification code was sent to your phone"
        redirect_to users_verify_sms_url
    elsif phone_number_changed == false
          current_user.update_attributes(user_params)
          flash[:notice] = "User information updated"
          redirect_to root_url
    elsif user_params[:phone_number].empty?
          flash[:error] = "Phone number cannot be blank. Please deselect 'Send sms' if you do not wish to receive text messages."
          redirect_to :back
    else flash[:error] = "There was an error. Please try again."
         redirect_to :back
    end 
end

def verify_sms
    @user = current_user
end

private

def user_params
    params.require(:user).permit(:email, :phone_number, :carrier, :send_email, :send_sms, :sms_verification_code, :sms_verification_code_conf, :sms_verified)
end

end