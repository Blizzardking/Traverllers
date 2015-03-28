class IndexController < ApplicationController
  def index
  end
  
  def is_login
     redirect_to home_page_path
  end
  
  def is_logout
  end
  
end
