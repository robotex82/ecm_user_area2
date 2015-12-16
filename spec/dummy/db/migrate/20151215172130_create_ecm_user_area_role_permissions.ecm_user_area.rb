# This migration comes from ecm_user_area (originally 20151215172042)
class CreateEcmUserAreaRolePermissions < ActiveRecord::Migration
  def change
    create_table :ecm_user_area_role_permissions do |t|
      t.references :role, index: true, foreign_key: true
      t.references :permission, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
