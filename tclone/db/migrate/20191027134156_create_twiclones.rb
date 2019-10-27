class CreateTwiclones < ActiveRecord::Migration[5.2]
  def change
    create_table :twiclones do |t|
    t.text :content
    end
  end
end
