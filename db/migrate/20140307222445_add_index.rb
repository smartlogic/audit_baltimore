class AddIndex < ActiveRecord::Migration
  def change
    add_index :voters, [:firstname, :lastname, :residentialzip5]
  end
end
