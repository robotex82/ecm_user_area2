# This migration comes from ecm_user_area (originally 20151215172018)
class CreateEcmUserAreaPermissions < ActiveRecord::Migration
  def change
    create_table :ecm_user_area_permissions do |t|
      t.string :identifier
      t.timestamp :enabled_from
      t.timestamp :enabled_to

      t.timestamps null: false
    end
  end
end
