class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer  :user_id
      t.string  :city
      t.string  :title
      t.text    :content
      t.string  :timestamp
      t.integer :comment_count
      t.string  :cover_url
      t.text  :img_small
      t.text  :img_big

      t.timestamps
    end
  end
end
