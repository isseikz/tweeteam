class AddColumnPostedAtToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :posted_at, :string
  end
end
