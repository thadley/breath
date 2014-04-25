class UsersController < ApplicationController

def edit
    @user = User.find(params[:id])
end

def update
    if current_user.update_attributes(user_params)
        flash[:notice] = "User information updated"
        redirect_to root_url
    else
        render "devise/registrations/edit"
    end
end

private

def user_params
    params.require(:user).permit(:email, :phone_number, :carrier, :send_email, :send_sms)
end

end