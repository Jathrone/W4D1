# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Artwork.delete_all
ArtworkShare.delete_all
user1 = User.create(username:"Hagrid")
user2 = User.create(username:"Hermione")
artwork1 = Artwork.create(title: "tranquility", image_url: "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", artist_id:user1.id)
ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user2.id)