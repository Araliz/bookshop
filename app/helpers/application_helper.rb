module ApplicationHelper
  def active?(*paths)
   'active' if paths.any?{ |path| current_page?(path) }
 end


 def star(a, b)
   if a >= b+1
   'btn-warning'
  else
    'btn-default btn-grey'
  end
 end

end
