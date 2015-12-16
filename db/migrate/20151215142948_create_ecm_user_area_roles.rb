class CreateEcmUserAreaRoles < ActiveRecord::Migration
  def change
    create_table :ecm_user_area_roles do |t|
      t.string :identifier
      t.timestamp :enabled_from
      t.timestamp :enabled_to

      t.timestamps null: false
    end
  end
end
