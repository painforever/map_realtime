#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel
exchange = channel.fanout('new_transaction')
queue = channel.queue('new_transaction', exclusive: true)

queue.bind(exchange)

puts ' [*] Waiting for new transactions. To exit press CTRL+C'

begin
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts "Message got: #{body}"
  end
rescue Interrupt => _
  channel.close
  connection.close
end