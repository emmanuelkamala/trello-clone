# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(email: "emmanuelkamala86@gmail.com", password: "kamala")

5.times do |i|
  Board.create(user: user, name: "Board #{i + 5}")
end

Board.find_each do |board| 
  5.times { |i| List.create(board: board, title: "List #{i + 5}") }
  
  board.reload.lists.each do |list| 
    5.times { |i| Item.create(list: list, title: "Item #{i + 5}") }
  end
end