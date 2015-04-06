class PagesController < ApplicationController
  before_action :logged_in_user, only: [:home]
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
