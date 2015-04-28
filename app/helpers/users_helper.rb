module UsersHelper
  include SessionsHelper
    # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 50 })
    size = options[:size]
    if user.avatar.present?
      image_tag(user.avatar.url(:thumb), size: "#{size}")
    else
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag(gravatar_url, alt: user.firstname, class: "gravatar", title: user.firstname)
    end
  end
 
end
