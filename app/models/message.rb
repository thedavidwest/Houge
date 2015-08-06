class Message < ActiveRecord::Base
  before_save :created_at

  def timestamp
    created_at_field = Time.in_time_zone.strftime("%a, %B %d, %I:%M %p")
  end
  def change
  end
end
