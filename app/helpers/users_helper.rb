module UsersHelper
  def created_events(user, name, events, title)
    render partial: name, locals: { obj: events, title: title } if user.events.size.positive?
  end

  def attended_events(user, name, events, title)
    return unless user.attended_events.size.positive?

    render partial: name, locals: { obj: events, title: title } if events.size.positive?
  end
end
