module UsersHelper
    
  def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    if (gravatar_id != nil)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar", :width => 45)
    else
        image_tag("https://cdn1.iconfinder.com/data/icons/ninja-things-1/1772/ninja-simple-512.png", :width => 45)
    end
  end
  
end