class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticated_user
    if current_user
      current_user
    elsif current_technician
      current_technician
    else
      nil
    end
  end

  def authenticated
    if current_user
      true
    elsif current_technician
      true
    else
      false
    end
  end


end
