module ArticlesHelper
  def article_header(article)
    unless controller.controller_name == 'users'
      return %(
        <div class="card-header">
          #{link_to article.user.name, article.user}
        </div>
      ).html_safe
    end

    nil
  end

  def render_article_item_actions(article)
    if controller.current_user == article.user
      return %(
        #{link_to 'Show', article, class: 'btn btn-dark', type: 'button'}
        #{link_to 'Edit', edit_article_path(article), class: 'btn btn-dark'}
        #{link_to 'Delete', article, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger'}
      ).html_safe
    else
      return %(
        #{link_to 'Show', article, class: 'btn btn-dark', type: 'button'}
      ).html_safe
    end
  end
end