require('poker')
require('rspec')

describe('poker') do
  it('searches for a royal flush, 5 of same suit and cards from 10 to ace following each other') do
    poker(['10S','JS', 'QS', 'KS', 'AS']).should(eq("Royal Flush"))
  end
  it('searches for a straight flush, 5 of the same suit and 5 sequential cards') do
    poker(['4D','5D','6D','7D','8D']).should(eq("Straight Flush"))
  end
  it('searches for a flush, 5 of the same suit and unsequential cards') do
    poker(['7C', 'KC', '2C', 'JC', '5C']).should(eq("Flush"))
  end
  it('searches for a straight, 5 sequential cards of different suits') do
    poker(['3D','4S','5H','6S','7C']).should(eq("Straight"))
  end
  it('searches for a four of the same face cards') do
    poker(['6D', '6C', '2C', '6H', '6S']).should(eq("Four of a Kind"))
  end
  it('searches for a full house, 3 of the same card and 2 of the same card e.g. 3 3s and 2 4s') do
    poker(['4D','3D','3C','3H','4C']).should(eq("Full House"))
  end
  it('searches for 3 of a kind, e.g. 3, 6s or 3 8s') do
    poker(['7D','KC','KH','KD','AD']).should(eq("Three of a Kind"))
  end
  it('searches for two pairs of matching "numbered" cards') do
    poker(['KD','4C','KD','JH','JH']).should(eq("Two Pairs"))
  end
  it('searches for one pair of matching "numbered" cards') do
    poker(['3D','7H','JS','3H','QC']).should(eq("One Pair"))
  end
  it('searches for no combination of cards') do
    poker(['QD', '3D', '7H', 'AC', '10S']).should(eq("High Card"))
  end
end
