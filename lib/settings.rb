class Settings
  include Mongoid::AppSettings

  APP_STATE = ['Maintenance', 'Live']

  setting :app_state, type: Integer, default: 0
end