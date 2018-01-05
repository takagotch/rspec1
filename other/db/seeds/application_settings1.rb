class CreateApplicationSettings < ActiveRecord::Migration
  def change
    create_table :application_settings do |t|
      t.string :application_name, null: false
      t.integer :session_timeout

      t.timestamps null: false
    end

    timestamp = Time.current.to_s(:db)
    execute(%Q{
      INSERT INTO application_settings
        (application_name, session_timeout, created_at, updated_at)
	VALUES('App', 60, '#{timestamp}', '#{timestamp}')
    })
  end
end

