def poker(user_hand)
  test_hand = []
  no_suit = []

  user_hand.each do |card|
    no_suit << card.slice(-1)
    card.delete! "C, D, H, S"

    if card == "J"
      test_hand << "11"
    elsif card == "Q"
      test_hand << "12"
    elsif card == "K"
      test_hand << "13"
    elsif card == "A"
      test_hand << "14"
    else test_hand << card
    end
  end

  test_hand = test_hand.sort
  test_hand.map! {|x| x.to_i}

  if no_suit.each_cons(2).all? {|pipes| pipes[1] == pipes[0]} && test_hand.each_cons(2).all? {|x| x[1] - x[0] == 1} && test_hand[0] == 10
    return "Royal Flush"
  elsif no_suit.each_cons(2).all? {|pipes| pipes[1] == pipes[0]} && test_hand.each_cons(2).all? {|x| x[1] - x[0] == 1}
    return "Straight Flush"
  elsif  no_suit.each_cons(2).all? {|pipes| pipes[1] == pipes[0]}
    return "Flush"
  elsif test_hand.each_cons(2).all? {|x| x[1] - x[0] == 1}
    return "Straight"
  elsif test_hand.first(4).each_cons(2).all? {|num| num[0] == num[1]} || test_hand.last(4).each_cons(2).all? {|num| num[0] == num[1]}
    return "Four of a Kind"
  elsif test_hand.uniq.length == 2
    return "Full House"
  elsif test_hand.first(3).each_cons(3).all? {|num| num[0] == num[1] && num[1] == num[2]} || test_hand.last(3).each_cons(3).all? {|num| num[0] == num[1] && num[1] == num[2]}
    return "Three of a Kind"
  elsif test_hand.uniq.length == 3
    return "Two Pairs"
  elsif test_hand.uniq.length == 4
    return "One Pair"
  else
    return "High Card"
  end
end