class EmailProcessor
  def self.process(email)
    user = User.find_by_email(email.from)
    board = Board.find_by_title(email.subject)
    card = user.cards.new({title: email.body, board_id: board.id, user_id: user.id, image: email.attachments[0]})

    puts card

    card.save
  end
end