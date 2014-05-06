class UsersController < ApplicationController

def edit
    @user = current_user
end

def update
    @user = current_user
    if current_user.update_attributes(user_params)
        if !current_user.sms_verified? && !user_params[:phone_number].empty?
            flash[:notice] = "A verification code was sent to your phone"
            redirect_to users_verify_sms_url
        else
            flash[:notice] = "User information updated"
            redirect_to edit_profile_url
        end
    else 
        flash[:error] = "There was an error. Please try again."
        render "users/edit"
    end 
end

def confirm_sms
  if current_user.update_attributes(user_params) && current_user.sms_verified?
    flash[:notice] = "Verification successful"
    redirect_to root_url
  else 
    flash[:error] = "That code is not valid."
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