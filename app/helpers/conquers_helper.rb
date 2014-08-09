module ConquersHelper

  # Intern Conquer
  def intern_conquer(c)
    (if c.intern
      "<i class='fa fa-check-circle' style='color: rgba(46, 204, 113, 0.6);'></i>"
    else
      "<i class='fa fa-circle' style='color: rgba(165,182,199,0.4)'></i>" 
    end).html_safe
  end

end
