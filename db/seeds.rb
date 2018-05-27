# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
user1 = User.create(firstname: "Rakesh", lastname: "Yadav", email: "rakesh.yadav@gmail.com", contact_number: 9500000111).first_or_create
user2 = User.create(firstname: "Ambesh", lastname: "Bansal", email: "ambesh.bansal@gmail.com", contact_number: 9500000112).first_or_create
user3 = User.create(firstname: "Abhinav", lastname: "Mishra", email: "abhinav.mishra@gmail.com", contact_number: 9500000113).first_or_create
user4 = User.create(firstname: "Aditya", lastname: "Swaroop", email: "aditya.swaroop@gmail.com", contact_number: 9500000114).first_or_create

cart1= Cart.create(user_id: 1)
cart2= Cart.create(user_id: 2)
cart3= Cart.create(user_id: 3)
cart4= Cart.create(user_id: 4)

category1 = Category.where(name: "Footwear", description: "Just do it").first_or_create
category2 = Category.where(name: "Sportswear", description: "Just do it").first_or_create
category3 = Category.where(name: "Casual Tshirt", description: "Just do it").first_or_create

item1 = Item.where(brand: "Nike", category_id: 1, name: "Sprint", price: 3999).first_or_create
item2 = Item.where(brand: "Nike", category_id: 1, name: "Flat run", price: 3499).first_or_create

item3 = Item.where(brand: "Nike", category_id: 2, name: "Slimfit tshirt", price: 2499).first_or_create
item4 = Item.where(brand: "Nike", category_id: 2, name: "Slimfit shorts", price: 2399).first_or_create
item5 = Item.where(brand: "Nike", category_id: 2, name: "Slimfit lower", price: 3399).first_or_create

item6 = Item.where(brand: "Nike", category_id: 3, name: "Slimfit polo tshirt", price: 2499).first_or_create
item7 = Item.where(brand: "Nike", category_id: 3, name: "Slimfit round neck tshirt", price: 2399).first_or_create
item8 = Item.where(brand: "Nike", category_id: 3, name: "Slimfit vneck tshirt", price: 3399).first_or_create

item9 = Item.where(brand: "Adidas", category_id: 2, name: "Slimfit tshirt", price: 1499).first_or_create
item10 = Item.where(brand: "Adidas", category_id: 2, name: "Slimfit shorts", price: 1399).first_or_create
item11 = Item.where(brand: "Adidas", category_id: 2, name: "Slimfit lower", price: 2399).first_or_create

store1 = Store.where(item_id: item1.id, pieces_remaining: 2).first_or_create
store2 = Store.where(item_id: item2.id, pieces_remaining: 3).first_or_create
store3 = Store.where(item_id: item3.id, pieces_remaining: 2).first_or_create
store4 = Store.where(item_id: item4.id, pieces_remaining: 1).first_or_create
store5 = Store.where(item_id: item5.id, pieces_remaining: 2).first_or_create
store6 = Store.where(item_id: item6.id, pieces_remaining: 3).first_or_create
store7 = Store.where(item_id: item7.id, pieces_remaining: 1).first_or_create
store8 = Store.where(item_id: item8.id, pieces_remaining: 0).first_or_create
store9 = Store.where(item_id: item9.id, pieces_remaining: 0).first_or_create
store10 = Store.where(item_id: item10.id, pieces_remaining: 2).first_or_create
store11 = Store.where(item_id: item11.id, pieces_remaining: 1).first_or_create

#User.search("Rakesh").records
#User.import(force: true)  creating index with import records
# User.import  Only import records, works only if index previously created
# User.__elasticsearch__.delete_index!  deleting index
# User.__elasticsearch__.create_index!  create index
# Item.import
#
