class CreateArticles < ActiveRecord::Migration
  # creates a method named change which will be called when you run this migration
  def change
  	# when run, it will create an articles table with one string column and a text column. 
    create_table :articles do |t|
      t.string :title
      t.text :text
      # also creates two timespam fields to allow rails to track article creation and update times
      t.timestamps null: false
    end
  end
end
