module ApplicationHelper

  def active_class_wo_class(path)
    if current_page?(path)
      'active'
    end
  end
  
end
