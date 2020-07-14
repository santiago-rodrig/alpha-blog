module CategoriesHelper
  def render_category_actions(category)
    show_link = link_to 'Show', category, class: 'btn btn-dark'
    edit_link = link_to 'Edit', edit_category_path(category),
      class: 'btn btn-dark'
    delete_link = link_to 'Delete', category, method: :delete,
      data: { confirm: 'Are you sure?' }, class: 'btn btn-dark'
    if current_user&.admin?
      return %(
      <div class="btn-group" role="group" aria-labeledby="category actions">
        #{show_link}
        #{edit_link}
        #{delete_link}
      </div>
      ).html_safe
    else
      return %(
      <div class="btn-group" role="group" aria-labeledby="category actions">
        #{show_link}
      </div>
      ).html_safe
    end
  end
end

