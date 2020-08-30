module EventsHelper
  def doevents(name, events)
    render partial: name, locals: { obj: events }
  end

  def alluser(users)
    users.each do |user|
      concat(content_tag(:hr) + content_tag(:p, (link_to user.name, user_path(user))))
    end
  end

  def event_attendee(event)
    event.attendees.each do |e|
      concat(content_tag(:hr) + content_tag(:p, e.name))
    end
  end
end
