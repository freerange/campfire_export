require 'bundler/setup'
require 'tinder'
require 'dotenv'
require 'csv'

Dotenv.load

campfire = Tinder::Campfire.new ENV['CAMPFIRE_SUBDOMAIN'], :token => ENV['CAMPFIRE_API_TOKEN']

room = Tinder::Room.new(campfire.connection, {'id' => ENV['CAMPFIRE_ROOM_ID'], 'name' => ENV['CAMPFIRE_ROOM_NAME']})

class << room
  def current_users
    []
  end
end

CSV($stdout) do |csv|
  csv << %w(id created_at user.name type body)
  date = Date.parse(ARGV[0])
  while date <= Date.today
    room.transcript(date).each do |message|
      csv << [message.id, message.created_at, message.user ? message.user.name : nil, message.type, message.body]
    end
    date += 1
  end
end
