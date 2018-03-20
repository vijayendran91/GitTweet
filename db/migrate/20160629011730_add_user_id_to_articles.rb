class AddUserIdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :username, :string
  end
end
