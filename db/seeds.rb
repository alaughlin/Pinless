# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "Luke", password: '123456', avatar: File.new("#{Rails.root}/seeds/images/luke.png"))
User.create(username: "Vader", password: '123456', avatar: File.new("#{Rails.root}/seeds/images/vader.jpeg"))
User.create(username: "Leia", password: '123456', avatar: File.new("#{Rails.root}/seeds/images/leia.jpg"))
User.create(username: "Han", password: '123456', avatar: File.new("#{Rails.root}/seeds/images/han.jpg"))
User.create(username: "Obi Wan", password: '123456', avatar: File.new("#{Rails.root}/seeds/images/obi_wan.jpg"))
User.create(username: "Lando", password: '123456', avatar: File.new("#{Rails.root}/seeds/images/lando.jpg"))
User.create(username: "Emperor", password: '123456', avatar: File.new("#{Rails.root}/seeds/images/emperor.jpeg"))
User.create(username: "Yoda", password: '123456', avatar: File.new("#{Rails.root}/seeds/images/yoda.png"))
User.create(username: "Boba Fett", password: '123456', avatar: File.new("#{Rails.root}/seeds/images/boba_fett.jpg"))

luke = User.find_by_username("Luke")
vader = User.find_by_username("Vader")
leia = User.find_by_username("Leia")
han = User.find_by_username("Han")
obi_wan = User.find_by_username("Obi Wan")
lando = User.find_by_username("Lando")
emperor = User.find_by_username("Emperor")
yoda = User.find_by_username("Yoda")
boba_fett = User.find_by_username("Boba Fett")

Board.create(user_id: luke.id, public: true, title: "Tatooine", description: "There's nothing for me here now", avatar: File.new("#{Rails.root}/seeds/images/tatooine.jpg"))
Board.create(user_id: vader.id, public: true, title: "Death Star", description: "The ability to destroy a planet is insignificant next to the power of the Force", avatar: File.new("#{Rails.root}/seeds/images/death_star.png"))
Board.create(user_id: leia.id, public: true, title: "Rebel Alliance", description: "Down with the Empire", avatar: File.new("#{Rails.root}/seeds/images/rebel.svg"))
Board.create(user_id: emperor.id, public: true, title: "Empire", description: "Everything that has transpired has done so according to my design", avatar: File.new("#{Rails.root}/seeds/images/empire.svg"))
Board.create(user_id: han.id, public: true, title: "Millenium Falcon", description: "It's the ship that made the Kessel Run in less than twelve parsecs", avatar: File.new("#{Rails.root}/seeds/images/falcon.jpg"))
Board.create(user_id: obi_wan.id, public: true, title: "Light Side", description: "Use the Force, Luke", avatar: File.new("#{Rails.root}/seeds/images/light_side.png"))
Board.create(user_id: lando.id, public: true, title: "Cloud City", description: "You truly belong here with us among the clouds", avatar: File.new("#{Rails.root}/seeds/images/cloud_city.jpg"))
Board.create(user_id: emperor.id, public: true, title: "Dark Side", description: "It is unavoidable. It is your destiny.", avatar: File.new("#{Rails.root}/seeds/images/dark_side.png"))
Board.create(user_id: yoda.id, public: true, title: "Dagobah", description: "Mudhole? Slimy? My home this is!", avatar: File.new("#{Rails.root}/seeds/images/dagobah.jpg"))

tatooine = Board.find_by_title("Tatooine")
death_star = Board.find_by_title("Death Star")
rebel_alliance = Board.find_by_title("Rebel Alliance")
empire = Board.find_by_title("Empire")
millenium_falcon = Board.find_by_title("Millenium Falcon")
light_side = Board.find_by_title("Light Side")
cloud_city = Board.find_by_title("Cloud City")
dark_side = Board.find_by_title("Dark Side")
dagobah = Board.find_by_title("Dagobah")

BoardLike.create(user_id: luke.id, board_id: tatooine.id)
BoardLike.create(user_id: luke.id, board_id: rebel_alliance.id)
BoardLike.create(user_id: luke.id, board_id: millenium_falcon.id)
BoardLike.create(user_id: luke.id, board_id: light_side.id)
BoardLike.create(user_id: luke.id, board_id: dagobah.id)
BoardLike.create(user_id: vader.id, board_id: death_star.id)
BoardLike.create(user_id: vader.id, board_id: empire.id)
BoardLike.create(user_id: vader.id, board_id: dark_side.id)
BoardLike.create(user_id: leia.id, board_id: rebel_alliance.id)
BoardLike.create(user_id: leia.id, board_id: light_side.id)
BoardLike.create(user_id: han.id, board_id: rebel_alliance.id)
BoardLike.create(user_id: han.id, board_id: millenium_falcon.id)
BoardLike.create(user_id: han.id, board_id: cloud_city.id)
BoardLike.create(user_id: obi_wan.id, board_id: tatooine.id)
BoardLike.create(user_id: obi_wan.id, board_id: rebel_alliance.id)
BoardLike.create(user_id: obi_wan.id, board_id: light_side.id)
BoardLike.create(user_id: obi_wan.id, board_id: dagobah.id)
BoardLike.create(user_id: lando.id, board_id: millenium_falcon.id)
BoardLike.create(user_id: lando.id, board_id: cloud_city.id)
BoardLike.create(user_id: emperor.id, board_id: death_star.id)
BoardLike.create(user_id: emperor.id, board_id: empire.id)
BoardLike.create(user_id: emperor.id, board_id: dark_side.id)
BoardLike.create(user_id: yoda.id, board_id: rebel_alliance.id)
BoardLike.create(user_id: yoda.id, board_id: light_side.id)
BoardLike.create(user_id: yoda.id, board_id: dagobah.id)
BoardLike.create(user_id: boba_fett.id, board_id: tatooine.id)
BoardLike.create(user_id: boba_fett.id, board_id: empire.id)

Friendship.create(user_id: luke.id, friend_id: leia.id)
Friendship.create(user_id: leia.id, friend_id: luke.id)
Friendship.create(user_id: luke.id, friend_id: han.id)
Friendship.create(user_id: han.id, friend_id: luke.id)
Friendship.create(user_id: luke.id, friend_id: obi_wan.id)
Friendship.create(user_id: obi_wan.id, friend_id: luke.id)
Friendship.create(user_id: obi_wan.id, friend_id: yoda.id)
Friendship.create(user_id: yoda.id, friend_id: obi_wan.id)
Friendship.create(user_id: luke.id, friend_id: lando.id)
Friendship.create(user_id: lando.id, friend_id: luke.id)
Friendship.create(user_id: luke.id, friend_id: yoda.id)
Friendship.create(user_id: yoda.id, friend_id: luke.id)
Friendship.create(user_id: han.id, friend_id: leia.id)
Friendship.create(user_id: leia.id, friend_id: han.id)
Friendship.create(user_id: han.id, friend_id: lando.id)
Friendship.create(user_id: lando.id, friend_id: han.id)
Friendship.create(user_id: leia.id, friend_id: obi_wan.id)
Friendship.create(user_id: obi_wan.id, friend_id: leia.id)
Friendship.create(user_id: leia.id, friend_id: lando.id)
Friendship.create(user_id: lando.id, friend_id: leia.id)
Friendship.create(user_id: vader.id, friend_id: emperor.id)
Friendship.create(user_id: emperor.id, friend_id: vader.id)
Friendship.create(user_id: vader.id, friend_id: boba_fett.id)
Friendship.create(user_id: boba_fett.id, friend_id: vader.id)
Friendship.create(user_id: emperor.id, friend_id: boba_fett.id)
Friendship.create(user_id: boba_fett.id, friend_id: emperor.id)

card = Card.create(user_id: luke.id, board_id: tatooine.id, title: "My Home", description: "Never going back", image: File.new("#{Rails.root}/seeds/images/cards/lars_homestead.jpg"))
CardLike.create(card_id: card.id, user_id: obi_wan.id)
CardLike.create(card_id: card.id, user_id: han.id)

card = Card.create(user_id: luke.id, board_id: rebel_alliance.id, title: "X-Wing Fighter", description: "Love flying these!", image: File.new("#{Rails.root}/seeds/images/cards/xwing.jpg"))
CardLike.create(card_id: card.id, user_id: han.id)
CardLike.create(card_id: card.id, user_id: leia.id)
CardLike.create(card_id: card.id, user_id: boba_fett.id)

card = Card.create(user_id: luke.id, board_id: millenium_falcon.id, title: "The Cockpit", description: "Too many close calls here", image: File.new("#{Rails.root}/seeds/images/cards/cockpit.png"))
CardLike.create(card_id: card.id, user_id: obi_wan.id)
CardLike.create(card_id: card.id, user_id: leia.id)
CardLike.create(card_id: card.id, user_id: han.id)
CardLike.create(card_id: card.id, user_id: lando.id)

card = Card.create(user_id: luke.id, board_id: light_side.id, title: "My lightsaber", description: "Never leave home without it", image: File.new("#{Rails.root}/seeds/images/cards/luke_lightsaber.jpeg"))
CardLike.create(card_id: card.id, user_id: obi_wan.id)
CardLike.create(card_id: card.id, user_id: leia.id)
CardLike.create(card_id: card.id, user_id: yoda.id)

card = Card.create(user_id: luke.id, board_id: dagobah.id, title: "Training Grounds", description: "Slimy mudhole, indeed", image: File.new("#{Rails.root}/seeds/images/cards/dagobah.jpg"))
CardLike.create(card_id: card.id, user_id: obi_wan.id)
CardLike.create(card_id: card.id, user_id: yoda.id)

card = Card.create(user_id: vader.id, board_id: death_star.id, title: "Superlaser Cannon", description: "Ok, it's kind of cool", image: File.new("#{Rails.root}/seeds/images/cards/superlaser.jpg"))
CardLike.create(card_id: card.id, user_id: boba_fett.id)
CardLike.create(card_id: card.id, user_id: emperor.id)

card = Card.create(user_id: vader.id, board_id: empire.id, title: "Galactic Senate", description: "Remember these jokers?", image: File.new("#{Rails.root}/seeds/images/cards/senate.png"))
CardLike.create(card_id: card.id, user_id: emperor.id)

card = Card.create(user_id: vader.id, board_id: dark_side.id, title: "Darth Maul", description: "Obi Wan took him down", image: File.new("#{Rails.root}/seeds/images/cards/darth_maul.jpg"))
CardLike.create(card_id: card.id, user_id: emperor.id)

card = Card.create(user_id: leia.id, board_id: rebel_alliance.id, title: "Throne Room", description: "Ceremony after takedown of Death Star", image: File.new("#{Rails.root}/seeds/images/cards/ceremony.jpg"))
CardLike.create(card_id: card.id, user_id: luke.id)
CardLike.create(card_id: card.id, user_id: han.id)

card = Card.create(user_id: leia.id, board_id: light_side.id, title: "Luke training", description: "He's a lot better now, I think", image: File.new("#{Rails.root}/seeds/images/cards/luke_training.jpg"))
CardLike.create(card_id: card.id, user_id: obi_wan.id)
CardLike.create(card_id: card.id, user_id: han.id)
CardLike.create(card_id: card.id, user_id: luke.id)

card = Card.create(user_id: han.id, board_id: rebel_alliance.id, title: "Rescuing the princess", description: "Little did I know...", image: File.new("#{Rails.root}/seeds/images/cards/falcon_death_star.jpg"))
CardLike.create(card_id: card.id, user_id: obi_wan.id)
CardLike.create(card_id: card.id, user_id: luke.id)
CardLike.create(card_id: card.id, user_id: leia.id)

card = Card.create(user_id: han.id, board_id: millenium_falcon.id, title: "Together in the cockpit", description: "Hyperspace, anyone?", image: File.new("#{Rails.root}/seeds/images/cards/han_cockpit.jpg"))
CardLike.create(card_id: card.id, user_id: leia.id)
CardLike.create(card_id: card.id, user_id: luke.id)
CardLike.create(card_id: card.id, user_id: lando.id)

card = Card.create(user_id: han.id, board_id: cloud_city.id, title: "Saying hello to Lando", description: "Hope he still doesn't hate me", image: File.new("#{Rails.root}/seeds/images/cards/han_cloud_city.jpg"))
CardLike.create(card_id: card.id, user_id: luke.id)
CardLike.create(card_id: card.id, user_id: leia.id)
CardLike.create(card_id: card.id, user_id: lando.id)

card = Card.create(user_id: obi_wan.id, board_id: tatooine.id, title: "Meeting Luke", description: "Finally", image: File.new("#{Rails.root}/seeds/images/cards/obi_luke.png"))
CardLike.create(card_id: card.id, user_id: luke.id)
CardLike.create(card_id: card.id, user_id: yoda.id)

card = Card.create(user_id: obi_wan.id, board_id: rebel_alliance.id, title: "Visiting Luke on Hoth", description: "Scared him, I think!", image: File.new("#{Rails.root}/seeds/images/cards/luke_vision.jpg"))
CardLike.create(card_id: card.id, user_id: luke.id)
CardLike.create(card_id: card.id, user_id: leia.id)
CardLike.create(card_id: card.id, user_id: yoda.id)

card = Card.create(user_id: obi_wan.id, board_id: light_side.id, title: "My lightsaber", description: "Trusty old friend", image: File.new("#{Rails.root}/seeds/images/cards/obi_wan_lightsaber.jpg"))
CardLike.create(card_id: card.id, user_id: luke.id)
CardLike.create(card_id: card.id, user_id: yoda.id)

card = Card.create(user_id: obi_wan.id, board_id: dagobah.id, title: "My Master's Home", description: "Never saw it, in person anyways", image: File.new("#{Rails.root}/seeds/images/cards/yoda_home_obi.jpg"))
CardLike.create(card_id: card.id, user_id: yoda.id)
CardLike.create(card_id: card.id, user_id: luke.id)

card = Card.create(user_id: lando.id, board_id: millenium_falcon.id, title: "Lost Gems", description: "Maybe he's giving it back to me?", image: File.new("#{Rails.root}/seeds/images/cards/falcon_cloud_city.png"))
CardLike.create(card_id: card.id, user_id: han.id)
CardLike.create(card_id: card.id, user_id: luke.id)

card = Card.create(user_id: lando.id, board_id: cloud_city.id, title: "My Home", description: "Love it here", image: File.new("#{Rails.root}/seeds/images/cards/cloud_city_rendering.jpg"))
CardLike.create(card_id: card.id, user_id: han.id)

card = Card.create(user_id: emperor.id, board_id: death_star.id, title: "View from the Top", description: "Vader doing my dirty work", image: File.new("#{Rails.root}/seeds/images/cards/vader_saber.jpg"))
CardLike.create(card_id: card.id, user_id: vader.id)

card = Card.create(user_id: emperor.id, board_id: empire.id, title: "My Throne", description: "Good place to relax", image: File.new("#{Rails.root}/seeds/images/cards/throne.jpg"))
CardLike.create(card_id: card.id, user_id: vader.id)

card = Card.create(user_id: emperor.id, board_id: dark_side.id, title: "Force Lightning", description: "Usually does the trick", image: File.new("#{Rails.root}/seeds/images/cards/lightning.jpg"))
CardLike.create(card_id: card.id, user_id: vader.id)

card = Card.create(user_id: yoda.id, board_id: rebel_alliance.id, title: "The Old Days", description: "Miss these guys", image: File.new("#{Rails.root}/seeds/images/cards/councel.jpg"))
CardLike.create(card_id: card.id, user_id: obi_wan.id)
CardLike.create(card_id: card.id, user_id: luke.id)

card = Card.create(user_id: yoda.id, board_id: light_side.id, title: "Training Luke", description: "He hated me during this", image: File.new("#{Rails.root}/seeds/images/cards/yoda_luke.jpg"))
CardLike.create(card_id: card.id, user_id: obi_wan.id)
CardLike.create(card_id: card.id, user_id: luke.id)
CardLike.create(card_id: card.id, user_id: leia.id)

card = Card.create(user_id: yoda.id, board_id: dagobah.id, title: "My Home", description: "Comfy, it is", image: File.new("#{Rails.root}/seeds/images/cards/yoda_home.png"))
CardLike.create(card_id: card.id, user_id: obi_wan.id)
CardLike.create(card_id: card.id, user_id: luke.id)

card = Card.create(user_id: boba_fett.id, board_id: tatooine.id, title: "Jabba's Palace", description: "Pretty cool place to kick it", image: File.new("#{Rails.root}/seeds/images/cards/jabba_palace.jpg"))
CardLike.create(card_id: card.id, user_id: vader.id)

card = Card.create(user_id: boba_fett.id, board_id: empire.id, title: "Chilling with Vader", description: "Dude is pretty cool", image: File.new("#{Rails.root}/seeds/images/cards/boba_vader.jpeg"))
CardLike.create(card_id: card.id, user_id: vader.id)
CardLike.create(card_id: card.id, user_id: emperor.id)
