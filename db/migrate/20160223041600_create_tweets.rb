class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user_id
      t.string :tweet_id
      t.text :content

      t.timestamps null: false
    end
  end
end
