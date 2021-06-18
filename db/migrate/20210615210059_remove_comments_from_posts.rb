class RemoveCommentsFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :comments, :text
  end
end
