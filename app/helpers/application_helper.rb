module ApplicationHelper
  # Returns a full title on a pe- page basis 
  def full_title(page_title = '')
      base_title = "Ruby On Rails Application"
      if page_title.empty? 
          base_title
      else 
          page_title + " | " + base_title
      end 
  end 
end
