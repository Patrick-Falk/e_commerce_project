# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

require 'csv'

def parse_csv file
  csv_text = File.read(Rails.root.join('lib', 'seeds', file))
  CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
end

# drop_table :categories
# drop_table :products
# drop_table :line_items
# drop_table :orders
# drop_table :customers
# drop_table :provinces

parse_csv('provinces.csv').each do |row|
  Province.create!(name: row['name'],
                   pst:  row['pst'],
                   gst: row['gst'],
                   hst: row['hst'])
end
