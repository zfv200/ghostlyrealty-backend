# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ghost1 = Ghost.create(username: "Casper", age: 1000)

house1 = House.create(name: "Winchester Mystery House", image_url: "https://media.cntraveler.com/photos/580e6787e62940c66bd2be0d/master/w_820,c_limit/winchester-mystery-house-san-jose-GettyImages-110714519.jpg", featured: true)
house2 = House.create(name: "Pittock Mansion", image_url: "https://media.cntraveler.com/photos/5bbef1ca2383b345456aaf3f/master/w_820,c_limit/Pittock-Mansion-GettyImages-636654304.jpg", featured: true)
house3 = House.create(name: "The Stanley Hotel", image_url: "https://media.cntraveler.com/photos/5bbef1be95086b24895894f5/master/w_820,c_limit/Stanley-Hotel-FYC359.jpg", featured: true)
house4 = House.create(name: "R.M.S. Queen Mary", image_url: "https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/5407/SITours/long-beach-shore-excursion-the-queen-mary-in-long-beach-151048.jpg", featured: true)
house5 = House.create(name: "The Bowery Hotel", image_url: "https://scontent-lax3-2.cdninstagram.com/vp/7f624365344a16d40d3e110d0e744225/5C81D80D/t51.2885-15/e35/c154.0.710.710/s480x480/43914991_596589297443162_2893776207825680222_n.jpg", featured: true)
