if ApplicationSetting.count == 0
  ApplicationSetting.create!(
    application_name: 'App',
    session_timeout: 60
  )
end

