Factory.define :user do |user|
  user.name                   "Aston Jay"
  user.email                  "aston@jay.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end

Factory.sequence :email do |d|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "foo bar"
  micropost.association :user
end