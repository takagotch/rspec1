class CreateApplicationSettings < ActiveRecord::Migration
  def change
    create_table :application_settings do |t|
      t.stinrg :application_name, null: false
      t.integer :session_timeout

      t.timestamps null: false
    end

    ApplicationSetting.create!(
      application_name: "App",
      session_timeout: 60
    )
  end
end

