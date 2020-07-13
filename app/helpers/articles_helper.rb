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
end