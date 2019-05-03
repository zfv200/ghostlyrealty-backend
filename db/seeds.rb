# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
House.destroy_all
Ghost.destroy_all

ghost1 = Ghost.create(username: "Casper", age: 1000, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaycrjjWPq991lmrgLoN8HP314ltT2xve_cgAZWnrREdtyuPBMdQ', password: "123")
ghost1.add_role :renter

ghost2 = Ghost.create(username: 'King Hamlet', age: 500, image: 'https://i.ytimg.com/vi/IBQucj2hea4/hqdefault.jpg', motto: "Lend thy serious hearing--for your next move!", password: "123", credits: 10)
ghost2.add_role :agent

ghost3 = Ghost.create(username: 'Zelda', age: 72, image: 'http://3.bp.blogspot.com/_m_yEp4yvWQY/S2GEFuMNbKI/AAAAAAAAU_8/_qdVYDBSKfA/s320/0.jpg', motto: 'This house is clean!', password: "123", featured: true, credits: 10)
ghost3.add_role :agent

ghost4 = Ghost.create(username: 'Ms. Cleo', age: 53, image: 'https://www.movieforums.com/community/attachment.php?attachmentid=26379&d=1469582112', motto: "Cleo can see your life--happy in a new haunt!", password: "123", featured: false, credits: 10)
ghost4.add_role :agent

ghost5 = Ghost.create(username: 'Venkman', age: 35, image: 'https://www.theraffon.net/~spookcentral/journal/venkmanjumpsuit03.jpg', motto: "You’re not gonna lose the house, everybody has three mortgages nowadays.", password: "123", featured: false, credits: 10)
ghost5.add_role :agent

ghost6 = Ghost.create(username: 'Tangina Barrons', age: 62, image: nil, motto: "I'm the real deal!" password: "123", featured: false, credits: 10)
ghost5.add_role :agent

house1 = House.create(
  medium: ghost2,
  name: "Winchester Mystery House",
  new_family: true,
  solo_haunt: false,
  burial_ground: false,
  image_url: "https://media.cntraveler.com/photos/580e6787e62940c66bd2be0d/master/w_820,c_limit/winchester-mystery-house-san-jose-GettyImages-110714519.jpg",
  featured: true,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique hendrerit libero ut hendrerit. Etiam pulvinar, tellus et suscipit aliquam, massa ligula egestas arcu, vel placerat tellus neque sed lorem. Sed laoreet metus quam, sit amet porta orci facilisis eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed mattis augue quis turpis efficitur, id egestas elit ultricies. Nullam libero libero, faucibus sit amet turpis vestibulum, blandit feugiat ligula. Praesent varius risus eu faucibus pellentesque. Nullam a iaculis est. Quisque a ante ipsum. Mauris mollis diam sit amet augue hendrerit, in egestas nunc volutpat. Quisque dictum convallis mauris, quis tempus nibh ullamcorper non. Aliquam sollicitudin justo non arcu pulvinar rhoncus."
)

house2 = House.create(
  medium: ghost3,
  name: "Pittock Mansion",
  new_family: true,
  solo_haunt: true,
  burial_ground: false,
  image_url: "https://media.cntraveler.com/photos/5bbef1ca2383b345456aaf3f/master/w_820,c_limit/Pittock-Mansion-GettyImages-636654304.jpg",
  featured: true,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique hendrerit libero ut hendrerit. Etiam pulvinar, tellus et suscipit aliquam, massa ligula egestas arcu, vel placerat tellus neque sed lorem. Sed laoreet metus quam, sit amet porta orci facilisis eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed mattis augue quis turpis efficitur, id egestas elit ultricies. Nullam libero libero, faucibus sit amet turpis vestibulum, blandit feugiat ligula. Praesent varius risus eu faucibus pellentesque. Nullam a iaculis est. Quisque a ante ipsum. Mauris mollis diam sit amet augue hendrerit, in egestas nunc volutpat. Quisque dictum convallis mauris, quis tempus nibh ullamcorper non. Aliquam sollicitudin justo non arcu pulvinar rhoncus."
)

house3 = House.create(
  medium: ghost4,
  name: "The Stanley Hotel",
  new_family: false,
  solo_haunt: false,
  burial_ground: true,
  image_url: "https://media.cntraveler.com/photos/5bbef1be95086b24895894f5/master/w_820,c_limit/Stanley-Hotel-FYC359.jpg",
  featured: true,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique hendrerit libero ut hendrerit. Etiam pulvinar, tellus et suscipit aliquam, massa ligula egestas arcu, vel placerat tellus neque sed lorem. Sed laoreet metus quam, sit amet porta orci facilisis eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed mattis augue quis turpis efficitur, id egestas elit ultricies. Nullam libero libero, faucibus sit amet turpis vestibulum, blandit feugiat ligula. Praesent varius risus eu faucibus pellentesque. Nullam a iaculis est. Quisque a ante ipsum. Mauris mollis diam sit amet augue hendrerit, in egestas nunc volutpat. Quisque dictum convallis mauris, quis tempus nibh ullamcorper non. Aliquam sollicitudin justo non arcu pulvinar rhoncus."
)

house4 = House.create(medium: ghost2,
  name: "R.M.S. Queen Mary",
  new_family: false,
  solo_haunt: false,
  burial_ground: false,
  image_url: "https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/5407/SITours/long-beach-shore-excursion-the-queen-mary-in-long-beach-151048.jpg",
  featured: true,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique hendrerit libero ut hendrerit. Etiam pulvinar, tellus et suscipit aliquam, massa ligula egestas arcu, vel placerat tellus neque sed lorem. Sed laoreet metus quam, sit amet porta orci facilisis eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed mattis augue quis turpis efficitur, id egestas elit ultricies. Nullam libero libero, faucibus sit amet turpis vestibulum, blandit feugiat ligula. Praesent varius risus eu faucibus pellentesque. Nullam a iaculis est. Quisque a ante ipsum. Mauris mollis diam sit amet augue hendrerit, in egestas nunc volutpat. Quisque dictum convallis mauris, quis tempus nibh ullamcorper non. Aliquam sollicitudin justo non arcu pulvinar rhoncus."
)

house5 = House.create(medium: ghost3,
  name: "The Bowery Hotel",
  new_family: false,
  solo_haunt: true,
  burial_ground: false,
  image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Bowery_Hotel_full.jpg/1024px-Bowery_Hotel_full.jpg",
  featured: true,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique hendrerit libero ut hendrerit. Etiam pulvinar, tellus et suscipit aliquam, massa ligula egestas arcu, vel placerat tellus neque sed lorem. Sed laoreet metus quam, sit amet porta orci facilisis eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed mattis augue quis turpis efficitur, id egestas elit ultricies. Nullam libero libero, faucibus sit amet turpis vestibulum, blandit feugiat ligula. Praesent varius risus eu faucibus pellentesque. Nullam a iaculis est. Quisque a ante ipsum. Mauris mollis diam sit amet augue hendrerit, in egestas nunc volutpat. Quisque dictum convallis mauris, quis tempus nibh ullamcorper non. Aliquam sollicitudin justo non arcu pulvinar rhoncus."
)

house6 = House.create(
  medium: ghost4,
  name: "The Old Johnson House",
  new_family: true,
  solo_haunt: true,
  burial_ground: false,
  image_url: "https://amp.businessinsider.com/images/562fbe249dd7cc1b008c528d-750-498.jpg",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique hendrerit libero ut hendrerit. Etiam pulvinar, tellus et suscipit aliquam, massa ligula egestas arcu, vel placerat tellus neque sed lorem. Sed laoreet metus quam, sit amet porta orci facilisis eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed mattis augue quis turpis efficitur, id egestas elit ultricies. Nullam libero libero, faucibus sit amet turpis vestibulum, blandit feugiat ligula. Praesent varius risus eu faucibus pellentesque. Nullam a iaculis est. Quisque a ante ipsum. Mauris mollis diam sit amet augue hendrerit, in egestas nunc volutpat. Quisque dictum convallis mauris, quis tempus nibh ullamcorper non. Aliquam sollicitudin justo non arcu pulvinar rhoncus."
)

house7 = House.create(
  medium: ghost2,
  name: "The Blair Witch House",
  new_family: false,
  solo_haunt: true,
  image_url: "https://farm4.staticflickr.com/3312/3301227631_f19845c422_b.jpg",
  address: "Maryland Woods",
  burial_ground: true,
  featured: true,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique hendrerit libero ut hendrerit. Etiam pulvinar, tellus et suscipit aliquam, massa ligula egestas arcu, vel placerat tellus neque sed lorem. Sed laoreet metus quam, sit amet porta orci facilisis eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed mattis augue quis turpis efficitur, id egestas elit ultricies. Nullam libero libero, faucibus sit amet turpis vestibulum, blandit feugiat ligula. Praesent varius risus eu faucibus pellentesque. Nullam a iaculis est. Quisque a ante ipsum. Mauris mollis diam sit amet augue hendrerit, in egestas nunc volutpat. Quisque dictum convallis mauris, quis tempus nibh ullamcorper non. Aliquam sollicitudin justo non arcu pulvinar rhoncus."
)
house8 = House.create(
  medium: ghost3,
  name: "LaLaurie Mansion",
  new_family: true,
  solo_haunt: false,
  burial_ground: true,
  image_url: 'https://www.tripsavvy.com/thmb/OaNGHt-7HtRagQrSF25ozF4ABOY=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/The_LaLaurie_Mansion-592ac0715f9b585950396d65.jpg',
  featured: false,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique hendrerit libero ut hendrerit. Etiam pulvinar, tellus et suscipit aliquam, massa ligula egestas arcu, vel placerat tellus neque sed lorem. Sed laoreet metus quam, sit amet porta orci facilisis eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed mattis augue quis turpis efficitur, id egestas elit ultricies. Nullam libero libero, faucibus sit amet turpis vestibulum, blandit feugiat ligula. Praesent varius risus eu faucibus pellentesque. Nullam a iaculis est. Quisque a ante ipsum. Mauris mollis diam sit amet augue hendrerit, in egestas nunc volutpat. Quisque dictum convallis mauris, quis tempus nibh ullamcorper non. Aliquam sollicitudin justo non arcu pulvinar rhoncus."
)
house9 = House.create(
  medium: ghost4,
  name: 'A Quaint Country Manor',
  new_family: true,
  solo_haunt: true,
  burial_ground: false,
  image_url: 'https://www.onecountry.com/wp-content/uploads/2017/12/origin-771.png',
  featured: true,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique hendrerit libero ut hendrerit. Etiam pulvinar, tellus et suscipit aliquam, massa ligula egestas arcu, vel placerat tellus neque sed lorem. Sed laoreet metus quam, sit amet porta orci facilisis eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed mattis augue quis turpis efficitur, id egestas elit ultricies. Nullam libero libero, faucibus sit amet turpis vestibulum, blandit feugiat ligula. Praesent varius risus eu faucibus pellentesque. Nullam a iaculis est. Quisque a ante ipsum. Mauris mollis diam sit amet augue hendrerit, in egestas nunc volutpat. Quisque dictum convallis mauris, quis tempus nibh ullamcorper non. Aliquam sollicitudin justo non arcu pulvinar rhoncus."
)

house10 = House.create(
  medium: ghost5,
  name: "Belvedere Castle",
  new_family: false,
  solo_haunt: false,
  burial_ground: true,
  image_url: 'https://www.centralpark.com/downloads/2056/download/belvedere-castle.jpe?cb=771cc09df21a8781d72b999f86b8c799&w=640',
  featured: true,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique hendrerit libero ut hendrerit. Etiam pulvinar, tellus et suscipit aliquam, massa ligula egestas arcu, vel placerat tellus neque sed lorem. Sed laoreet metus quam, sit amet porta orci facilisis eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed mattis augue quis turpis efficitur, id egestas elit ultricies. Nullam libero libero, faucibus sit amet turpis vestibulum, blandit feugiat ligula. Praesent varius risus eu faucibus pellentesque. Nullam a iaculis est. Quisque a ante ipsum. Mauris mollis diam sit amet augue hendrerit, in egestas nunc volutpat. Quisque dictum convallis mauris, quis tempus nibh ullamcorper non. Aliquam sollicitudin justo non arcu pulvinar rhoncus."
)

house11 = House.create(
  medium: ghost4,
  name: "The Amityville Horror House",
  new_family: true,
  solo_haunt: true,
  burial_ground: true,
  image_url: 'https://ei.marketwatch.com/Multimedia/2016/06/29/Photos/ZH/MW-EQ389_amityv_20160629095319_ZH.jpg?uuid=d64cff2a-3e00-11e6-89f4-0015c588dfa6',
  featured: true,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique hendrerit libero ut hendrerit. Etiam pulvinar, tellus et suscipit aliquam, massa ligula egestas arcu, vel placerat tellus neque sed lorem. Sed laoreet metus quam, sit amet porta orci facilisis eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed mattis augue quis turpis efficitur, id egestas elit ultricies. Nullam libero libero, faucibus sit amet turpis vestibulum, blandit feugiat ligula. Praesent varius risus eu faucibus pellentesque. Nullam a iaculis est. Quisque a ante ipsum. Mauris mollis diam sit amet augue hendrerit, in egestas nunc volutpat. Quisque dictum convallis mauris, quis tempus nibh ullamcorper non. Aliquam sollicitudin justo non arcu pulvinar rhoncus."
)
