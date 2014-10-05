class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  def owner_verify(model, url)
    if user_signed_in?
      if (current_user.email != model.email && (!current_user.admin?))
        redirect_to url, :alert => 'Permissão Negada. Você não Tem Autorização.'
        return false
      end

      return true
    end
  end

end
