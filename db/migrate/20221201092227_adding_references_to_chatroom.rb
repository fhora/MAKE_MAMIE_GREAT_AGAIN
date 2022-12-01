class AddingReferencesToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :user, foreign_key: true
    add_reference :chatrooms, :mission_candidate, foreign_key: true
  end
end
