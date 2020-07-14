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
    if current_user == article.user || current_user.admin?
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

  def render_show_article_actions(article)
    if current_user == article.user || current_user.admin?
      return %(
        <div class="btn-group mt-3" role="group" aria-label="Article actions">
          #{link_to 'Edit', edit_article_path(@article), class: 'btn btn-dark', role: 'button', type: 'button'}
          #{link_to 'Delete', @article, class: 'btn btn-danger', role: 'button', type: 'button', data: { confirm: 'Are you sure?' }}
        </div>
      ).html_safe
    end

    nil
  end
end