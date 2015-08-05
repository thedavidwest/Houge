class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.created_at.strftime("%a, %B %d, at %I:%M%p") 
    end
  end
end
