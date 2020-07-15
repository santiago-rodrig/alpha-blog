module CategoriesHelper
  def render_show_category_actions(category)
    edit_link = link_to 'Edit', edit_category_path(category),
      class: 'btn btn-dark'
    delete_link = link_to 'Delete', category, method: :delete,
      data: { confirm: 'Are you sure?' }, class: 'btn btn-danger'
    if current_user&.admin?
      return %(
      <div class="d-flex justify-content-center mt-3">
        <div class="btn-group" role="group" aria-labeledby="category actions">
          #{edit_link}
          #{delete_link}
        </div>
      </div>
      ).html_safe
    end

    nil
  end

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

  def render_categories_badges(categories)
    categories.to_a.map do |c|
      link_to c.name, c, class: 'badge badge-secondary'
    end.join(', ').html_safe
  end
end

