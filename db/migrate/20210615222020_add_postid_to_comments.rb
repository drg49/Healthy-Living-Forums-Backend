class AddPostidToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :postid, :integer
  end
end
