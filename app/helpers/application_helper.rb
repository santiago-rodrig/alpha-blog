module ApplicationHelper
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
    if controller.current_user
      return %(
        <li class="nav-item mr-2">
          #{link_to 'Logout', logout_path, method: :delete, class: 'btn btn-sm btn-light'}
        </li>
      ).html_safe
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
end
