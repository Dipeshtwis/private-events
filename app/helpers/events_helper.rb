module EventsHelper
  def doevents(name, events)
    render partial: name, locals: { obj: events}
  end

  def alluser(users)
  	users.each do |user|
  	  content_tag(:p, (link_to user.name, user_path(user)))
  	end
  end
end
