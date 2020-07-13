module UsersHelper
  def gravatar_for(user, size)
    digest = Digest::MD5.hexdigest(user.email)
    image_tag "https://www.gravatar.com/avatar/#{digest}?size=#{size}", id: 'avatar', alt: user.name, class: 'rounded img-thumbnail'
  end

  def render_user_item_actions(user)
    if current_user == user
      return %(
        #{link_to 'Show', user, class: 'btn btn-dark'}
        #{link_to 'Edit', edit_user_path(user), class: 'btn btn-dark'}
        #{link_to 'Delete', user, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger'}
      ).html_safe
    else
      return %(
        #{link_to 'Show', user, class: 'btn btn-dark'}
      ).html_safe
    end
  end
end
