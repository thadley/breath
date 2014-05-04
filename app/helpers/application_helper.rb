module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end

# to access Devise form in non-Devise controller,
# displays proper error messages
# http://stackoverflow.com/questions/4081744/devise-form-within-a-different-controller
