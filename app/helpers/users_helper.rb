module UsersHelper
  def gravatar_for(user, size)
    digest = Digest::MD5.hexdigest(user.email)
    image_tag "https://www.gravatar.com/avatar/#{digest}?size=#{size}", id: 'avatar', alt: @user.name, class: 'rounded img-thumbnail'
  end
end
