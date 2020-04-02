User.create!(
  username: 'johndoe'
)

User.create!(
  username: 'janedoe'
)

p "Created 2 users!"

Vital.create!(
  category: 'weight',
  measure: '130 LBS',
  user: User.first
)

Vital.create!(
  category: 'weight',
  measure: '132 LBS',
  user: User.first
)

Vital.create!(
  category: 'weight',
  measure: '135 LBS',
  user: User.first
)

p "Created 3 weights!"

Vital.create!(
  category: 'temperature',
  measure: '36.3 C',
  created_at: Date.yesterday,
  user: User.first
)

Vital.create!(
  category: 'mood',
  measure: 'Cheerful',
  created_at: Date.yesterday,
  user: User.first
)

p "Created 2 vitals for yesterday!"

Vital.create!(
  category: 'weight',
  measure: '125 LBS',
  created_at: 1.week.ago,
  user: User.first
)

p "Created 1 vital for 1 week ago"