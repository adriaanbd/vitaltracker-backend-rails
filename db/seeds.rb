User.create!(
  username: 'johndoe'
)

User.create!(
  username: 'janedoe'
)

p "Created 2 users!"

today = Date.today.advance(:days => 0)
yesterday = Date.today.advance(:days => -1)
one_week_ago = Date.today.advance(:days => -7)

Vital.create!(
  category: 'temperature',
  measure: '36.3 C',
  created_at: yesterday,
  updated_at: yesterday,
  user: User.first
)

Vital.create!(
  category: 'mood',
  measure: 'Cheerful',
  created_at: yesterday,
  updated_at: yesterday,
  user: User.first
)

p "Created 2 vitals for yesterday!"

Vital.create!(
  category: 'weight',
  measure: '125 LBS',
  created_at: one_week_ago,
  updated_at: one_week_ago,
  user: User.first
)

Vital.create!(
  category: 'mood',
  measure: 'Romantic',
  created_at: one_week_ago,
  updated_at: one_week_ago,
  user: User.first
)

p "Created 2 vital for 1 week ago"