module ApplicationHelper
  def render_nav_link(text, url)
    controller_info = {
      name: controller.controller_name,
      action: controller.action_name
    }
    result = link_to text, url, class: 'nav-link'
    case url
    when articles_path
      if controller_info == { name: 'articles', action: 'index' }
        result = link_to text, url, class: 'nav-link active'
      end
    when users_path
      if controller_info == { name: 'users', action: 'index' }
        result = link_to text, url, class: 'nav-link active'
      end
    when categories_path
      if controller_info == { name: 'categories', action: 'index' }
        result = link_to text, url, class: 'nav-link active'
      end
    end

    result.html_safe
  end

  def render_account_dropdown
    if controller.current_user
      return %(
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Account
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          #{link_to 'Profile', current_user, class: 'dropdown-item'}
          #{link_to 'Edit', edit_user_path(current_user), class: 'dropdown-item'}
        </div>
      </li>
      ).html_safe
    end

    nil
  end

  def render_account_access
    user = controller.current_user
    if user
      if user.admin?
        return %(
        <li class="nav-item mr-3 text-light text-muted">
          (Admin) Logged as #{user.name}
        </li>
        <li class="nav-item">
          #{link_to 'Logout', logout_path, method: :delete, class: 'btn btn-sm btn-light'}
        </li>
        ).html_safe
      else
        return %(
        <li class="nav-item mr-3 text-light text-muted">
          Logged as #{user.name}
        </li>
        <li class="nav-item">
          #{link_to 'Logout', logout_path, method: :delete, class: 'btn btn-sm btn-light'}
        </li>
        ).html_safe
      end
    else
      return %(
      <li class="nav-item mr-2">
        #{link_to 'Login', login_path, class: 'btn btn-sm btn-light'}
      </li>
      <li class="nav-item">
        #{link_to 'Sign up', signup_path, class: 'btn btn-sm btn-primary'}
      </li>
      ).html_safe
    end
  end

  def render_actions
    if current_user&.admin?
      return %(
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Actions
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        #{link_to 'New article', new_article_path, class: 'dropdown-item'}
        #{link_to 'New category', new_category_path, class: 'dropdown-item'}
        </div>
        </li>
      ).html_safe
    elsif current_user
      return %(
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Actions
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        #{link_to 'New article', new_article_path, class: 'dropdown-item'}
        </div>
        </li>
      ).html_safe
    end

    nil
  end
end

