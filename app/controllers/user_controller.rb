class UserController < ApplicationController

def email
end

def update
    if current_user.update_attributes(user_params)
        flash[:notice] = "User information updated"
        redirect_to edit_user_registration_path(current_user)
    else
        render "root"
    end
end

private

def user_params
    params.require(:user).permit(:email)
end

end