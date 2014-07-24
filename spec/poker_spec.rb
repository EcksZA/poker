require('poker')
require('rspec')

describe('poker') do
  it('searches for a royal flush, 5 of same suit and cards from 10 to ace following each other') do
  poker(['10S','JS', 'QS', 'KS', 'AS']).should(eq("Royal Flush"))
  end
end
