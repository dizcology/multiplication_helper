# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### Add some users.  I'm using an array of hashes that contain the user info

[
  { 
    name: "tester"
  },
  {
    name: "Matthew"
  },
  {
    name: "Yu-Han"
  },
  {
    name: "Candace"
  }
].each do |user|
  User.find_or_create_by(name: user[:name])
  Trait.find_or_create_by(user_id: User.find_by(name: user[:name]).id)
end

### Add some items, same structure as before.  

(1..12).each do |i|
  (1..12).each do |j|
    itemname="#{i}times#{j}"
    Item.find_or_create_by(name:itemname, content: "#{i} \\times #{j}", answer: "#{i*j}", tag: itemname)
    
    ActiveRecord::Migration.add_column :traits, itemname.to_sym, :float, :default=>0.0
  end
  
  
end

=begin
[
  {
    name: "Multiply",
    content: "What is 5x3?"
  },
  {
    name: "Add",
    content: "What is 5+3?"
  }
].each do |item|
  Item.find_or_create_by(name: item[:name], content: item[:content])
end
=end
### You could do Item.find_or_create_by(name: "Multiply", content: "What is 5x3?"), Item.find_or_create_by(name...), and have one line for each thing, rather than pulling them from an array of hashes, but this feals more programattically correct to me.