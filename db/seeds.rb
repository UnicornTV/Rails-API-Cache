admin = User.new(
  email: 'demo@unicorn.teevee',
  first_name: 'Demo',
  last_name: 'User',
  roles: ['admin'],
  password: 'demo1234',
  password_confirmation: 'demo1234'
)
admin.skip_confirmation!
admin.save!
