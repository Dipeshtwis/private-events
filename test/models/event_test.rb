require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = Event.new(name: 'FirstEvent', description: 'Description of the first event',
                       location: 'chess.com', date: '2020-08-30, 20:00 ', creator_id: 1)
  end

  test 'event name should be present' do
    @event.name = ' '
    assert_not @event.valid?
  end

  test 'event description should be present' do
    @event.description = ' '
    assert_not @event.valid?
  end

  test 'event location should be present' do
    @event.location = ' '
    assert_not @event.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
