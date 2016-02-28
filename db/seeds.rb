# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:id => 0, :name => 'System')
Status.create(:id => 0, :name => 'Waiting')
Status.create(:id => 1, :name => 'In Process')
Status.create(:id => 2, :name => 'Succeeded')
Status.create(:id => 3, :name => 'Failured')
