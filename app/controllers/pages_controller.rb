class PagesController < ApplicationController
  before_action :logged_in_user, only: [:home, :my_search]
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @users = current_user.following
    end
  end  
  
  def my_search
    if logged_in?
      @users = current_user.following
      keyword = params[:search]
      if !keyword
        keyword = getKeyword
      else 
        saveKeyword(keyword)
      end
      @feed_items = current_user.feed_by_query(keyword).paginate(page: params[:page])
    end
  end
end
