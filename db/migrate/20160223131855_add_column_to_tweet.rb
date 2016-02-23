class AddColumnToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :date, :timestamp
  end
end
