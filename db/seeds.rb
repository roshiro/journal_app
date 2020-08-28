User.create(name: 'Bob',email: 'admin@example.com', password: '12341234', password_confirmation: '12341234')

Instrument.create(name: 'AUDUSD', description: 'Australian Dollar / US Dollar')

s1 = Strategy.create(name: 'MTF Pullback with trend', description: '')

Setup.create(name: 'Break of structure', strategy: s1, description: 'Reduced risk entry')
Setup.create(name: 'Double top/bottom', strategy: s1, description: 'Risky entry')
