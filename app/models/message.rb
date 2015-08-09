class Message < ActiveRecord::Base
  belongs_to :user
  before_save :created_at
  def timestamp
    created_at_field = Time.in_time_zone.strftime("%a, %B %d, %I:%M %p")
  end
  def change
  end
end
