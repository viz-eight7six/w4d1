require 'addressable/uri'
require 'rest-client'

# def index_users
#   url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users/5.json',
#   query_values: {
#     'some_category[a_key]' => 'another value',
#     'some_category[a_second_key]' => 'yet another value',
#     'some_category[inner_inner_hash][key]' => 'value',
#     'something_else' => 'aaahhhhh'
#     }
#   ).to_s
#
#     puts RestClient.get(url)
# end
#
# index_users

def create_user(name, email)


    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.json'
    ).to_s
  begin
    puts RestClient.post(
      url,
      { user: { name: name, email: email } }
    )
  rescue RestClient::Exception => e
    puts e.message
    puts "Enter your name:"
    name = gets.chomp
    puts "Enter your email:"
    email = gets.chomp
    retry
  end
end

create_user("Gizmo", "gizmo@gizmo.gizmo")
