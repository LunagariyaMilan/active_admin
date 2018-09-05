class CreateJoinTableProfileRole < ActiveRecord::Migration[5.2]
  def change
    create_join_table :profiles, :roles do |t|
      # t.index [:profile_id, :role_id]
      # t.index [:role_id, :profile_id]
    end
  end
end
