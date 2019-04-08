# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ghost1 = Ghost.create(username: "Casper", age: 1000, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaycrjjWPq991lmrgLoN8HP314ltT2xve_cgAZWnrREdtyuPBMdQ', password: "123")
ghost1.add_role :renter

ghost2 = Ghost.create(username: 'King Hamlet', age: 500, image: 'https://i.ytimg.com/vi/IBQucj2hea4/hqdefault.jpg', motto: "Lend thy serious hearing--for your next move!", password: "123")
ghost2.add_role :agent

ghost3 = Ghost.create(username: 'Zelda', age: 72, image: 'http://3.bp.blogspot.com/_m_yEp4yvWQY/S2GEFuMNbKI/AAAAAAAAU_8/_qdVYDBSKfA/s320/0.jpg', motto: 'This house is clean!', password: "123", featured: true)
ghost3.add_role :agent

house1 = House.create(name: "Winchester Mystery House", solo_haunt: false, image_url: "https://media.cntraveler.com/photos/580e6787e62940c66bd2be0d/master/w_820,c_limit/winchester-mystery-house-san-jose-GettyImages-110714519.jpg", featured: true, burial_ground: false)
house2 = House.create(name: "Pittock Mansion", solo_haunt: true, image_url: "https://media.cntraveler.com/photos/5bbef1ca2383b345456aaf3f/master/w_820,c_limit/Pittock-Mansion-GettyImages-636654304.jpg", featured: true, burial_ground: false)
house3 = House.create(name: "The Stanley Hotel", solo_haunt: false, image_url: "https://media.cntraveler.com/photos/5bbef1be95086b24895894f5/master/w_820,c_limit/Stanley-Hotel-FYC359.jpg", featured: true, burial_ground: false)
house4 = House.create(name: "R.M.S. Queen Mary", solo_haunt: false, image_url: "https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/5407/SITours/long-beach-shore-excursion-the-queen-mary-in-long-beach-151048.jpg", featured: true, burial_ground: false)
house5 = House.create(name: "The Bowery Hotel", solo_haunt: true, image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Bowery_Hotel_full.jpg/1024px-Bowery_Hotel_full.jpg", featured: true, burial_ground: false)
house6 = House.create(name: "The Old Johnson House", solo_haunt: true, image_url: "https://amp.businessinsider.com/images/562fbe249dd7cc1b008c528d-750-498.jpg", burial_ground: true)
