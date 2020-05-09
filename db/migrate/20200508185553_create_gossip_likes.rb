class CreateGossipLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :gossip_likes do |t|
      t.references :user, index: true
      t.references :gossip, index: true 
      t.timestamps
    end
  end
end
