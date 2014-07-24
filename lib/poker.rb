def poker(user_hand)
  convertToInt = []
  test_hand = []

  user_hand.each_with_index do |user_hand, index|
    convertToInt << user_hand[index][0].to_i
    puts convertToInt
    if convertToInt[index] > 0
      test_hand << user_hand[index]
    else
       if user_hand[index][0] == "J"
        test_hand << "11" + user_hand[index][-1]
      elsif user_hand[index][0] == "Q"
        test_hand << "12" + user_hand[index][-1]
      elsif user_hand[index][0] == "K"
        test_hand << "13" + user_hand[index][-1]
      else user_hand[index][0] == "A"
        test_hand << "14" + user_hand[index][-1]
      end

    end
  end


  test_hand = test_hand.sort

  user_cards = []
  counter = 0
  test_hand.each do |test_hand, index|
    if test_hand[0][-1] == test_hand[0 + counter][-1]
      user_cards << test_hand[index][-1]
      counter += 1
    end
  end

  if user_cards.length == 5 && test_hand[0][0,2] == 10
    return "Royal Flush"
  end
end

# poker
