class RemoveIndex < ActiveRecord::Migration
  def change
    remove_index :voters, [:firstname, :lastname, :mailingzip5]
  end
end
