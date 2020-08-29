module ApplicationHelper
  def check_member
    res = ''
    if logged_in?
      res << link_to('Profile', user_path(session[:user_id]), class: 'btn btn-outline-success mr-3')
      res << (link_to 'Log out', logout_path, method: :delete,
                                              class: 'mr-2 btn btn-outline-danger')
    else
      res << (link_to 'Sign in', sign_in_path, class: 'mr-2 btn btn-outline-primary')
      res << (link_to 'Sign Up', new_user_path, class: 'mr-2 btn btn-outline-light')
    end
    res.html_safe
  end
end
