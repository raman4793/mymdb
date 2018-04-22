module ApplicationHelper

  def poster(url)
    "https://image.tmdb.org/t/p/w185_and_h278_bestv2#{url}"
  end

  def can_do
    current_user or current_technician
  end

  def authenticated_user
    if current_user
      current_user
    elsif current_technician
      current_technician
    else
      nil
    end
  end


end
