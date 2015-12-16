# This migration comes from ecm_user_area (originally 20151215165147)
class CreateEcmUserAreaUserRoles < ActiveRecord::Migration
  def change
    create_table :ecm_user_area_user_roles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
