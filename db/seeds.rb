# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  require Rails.root.join('db', 'init', 'init_user.rb')
  require Rails.root.join('db', 'init', 'init_business.rb')
  require Rails.root.join('db', 'init', 'init_goods.rb')
  require Rails.root.join('db', 'init', 'init_photo.rb')
  require Rails.root.join('db', 'init', 'init_recommend.rb')
  require Rails.root.join('db', 'init', 'init_advert.rb')
  require Rails.root.join('db', 'init', 'init_discover.rb')
end