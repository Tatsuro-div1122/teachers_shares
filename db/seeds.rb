# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin.com',
   password: 'admins')

require "csv"

CSV.foreach('db/users.csv', headers: true) do |row|
  User.create!(
    id: row['id'],
    last_name: row['last_name'],
    first_name: row['first_name'],
    prefecture: row['prefecture'],
    school_type: row['school_type']
    school_name: row['school_name']
    subject: row['subject']
    year: row['year']
    email: row['email']
    password: row['password']
    introduction: row['introduction']
    created_at: row['created_at'])
end