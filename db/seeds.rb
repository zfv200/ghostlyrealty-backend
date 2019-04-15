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

ghost4 = Ghost.create(username: 'Ms. Cleo', age: 53, image: 'https://www.movieforums.com/community/attachment.php?attachmentid=26379&d=1469582112', motto: "Cleo can see your life--happy in a new haunt!", password: "123", featured: false)
ghost4.add_role :agent

ghost5 = Ghost.create(username: 'Venkman', age: 35, image: 'https://www.theraffon.net/~spookcentral/journal/venkmanjumpsuit03.jpg', motto: "You’re not gonna lose the house, everybody has three mortgages nowadays.", password: "123", featured: false)

house1 = House.create(medium: ghost2, name: "Winchester Mystery House", solo_haunt: false, image_url: "https://media.cntraveler.com/photos/580e6787e62940c66bd2be0d/master/w_820,c_limit/winchester-mystery-house-san-jose-GettyImages-110714519.jpg", featured: true, burial_ground: false)
house2 = House.create(medium: ghost3, name: "Pittock Mansion", solo_haunt: true, image_url: "https://media.cntraveler.com/photos/5bbef1ca2383b345456aaf3f/master/w_820,c_limit/Pittock-Mansion-GettyImages-636654304.jpg", featured: true, burial_ground: false)
house3 = House.create(medium: ghost4, name: "The Stanley Hotel", solo_haunt: false, image_url: "https://media.cntraveler.com/photos/5bbef1be95086b24895894f5/master/w_820,c_limit/Stanley-Hotel-FYC359.jpg", featured: true, burial_ground: false)
house4 = House.create(medium: ghost2, name: "R.M.S. Queen Mary", solo_haunt: false, image_url: "https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/5407/SITours/long-beach-shore-excursion-the-queen-mary-in-long-beach-151048.jpg", featured: true, burial_ground: false)
house5 = House.create(medium: ghost3, name: "The Bowery Hotel", solo_haunt: true, image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Bowery_Hotel_full.jpg/1024px-Bowery_Hotel_full.jpg", featured: true, burial_ground: false)
house6 = House.create(medium: ghost4, name: "The Old Johnson House", solo_haunt: true, image_url: "https://amp.businessinsider.com/images/562fbe249dd7cc1b008c528d-750-498.jpg", burial_ground: true)
house7 = House.create(medium: ghost2, name: "The Blair Witch House", solo_haunt: true, image_url: "https://farm4.staticflickr.com/3312/3301227631_f19845c422_b.jpg", address: "Maryland Woods", burial_ground: true, featured: true)
house8 = House.create(medium: ghost3, name: "LaLaurie Mansion", solo_haunt: false, burial_ground: true, image_url: 'https://www.tripsavvy.com/thmb/OaNGHt-7HtRagQrSF25ozF4ABOY=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/The_LaLaurie_Mansion-592ac0715f9b585950396d65.jpg', featured: false)
house9 = House.create(medium: ghost4, name: 'A Quaint Country Manor', solo_haunt: true, burial_ground: false, image_url: 'https://www.onecountry.com/wp-content/uploads/2017/12/origin-771.png', featured: true)
house10 = House.create(medium: ghost5, name: "Belvedere Castle", solo_haunt: false, burial_ground: true, image_url: 'https://www.centralpark.com/downloads/2056/download/belvedere-castle.jpe?cb=771cc09df21a8781d72b999f86b8c799&w=640', featured: true)
