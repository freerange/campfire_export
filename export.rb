require 'bundler/setup'
require 'tinder'
require 'dotenv'

Dotenv.load

campfire = Tinder::Campfire.new ENV['CAMPFIRE_SUBDOMAIN'], :token => ENV['CAMPFIRE_API_TOKEN']

room = Tinder::Room.new(campfire.connection, {'id' => ENV['CAMPFIRE_ROOM_ID'], 'name' => ENV['CAMPFIRE_ROOM_NAME']})

class << room
  def current_users
    []
  end
end

date = Date.parse(ARGV[0])
while date <= Date.today
  puts room.transcript(date).select { |m| m.type == 'TextMessage' }.map { |m| [m.created_at, m.user.name, m.body].join("\t") }
  date += 1
end
