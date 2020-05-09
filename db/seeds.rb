require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all

10.times do
  city = City.create(
    name: Faker::Nation.capital_city,
    zip_code: Faker::Address.zip_code
  )
end

10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.sentence,
    email: Faker::Internet.email,
    age: rand(16..88),
    city: City.all.sample
    )
end

20.times do
  gossip = Gossip.create(
    title: Faker::Movies::StarWars.wookiee_words.sample,
    content: Faker::Movies::HarryPotter.quote,
    user: User.all.sample
    )
end


10.times do
    tag = Tag.create(
        title: Faker::App.name
    )
end


30.times do
    gossip_tag = GossipTag.create(
        gossip: Gossip.all.sample,
        tag: Tag.all.sample
    )
end


10.times do
    private = PrivateMessage.new
    private.sender = User.all.sample
    private.recipient = User.all.sample
    private.content = Faker::ChuckNorris.fact
    private.save
end
