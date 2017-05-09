module ApplicationHelper

  def flash_class(key)
    case key
    when "success" then "alert alert-success"
    when "notice" then "alert alert-info"
    when "alert" then "alert alert-danger"
    end
  end

end
