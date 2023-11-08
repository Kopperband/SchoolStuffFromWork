Deck = []
#DeckDict is cards and there values
DeckDict = {}
DeckValue = []
DictKey = []
$pointsInHand = 0
$dealerPointsInHand = 0


def DeckOfCards()
  x = 0
  value = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
  number = ["Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King"]
  suits = [ "Spades", "Clubs", "Hearts", "Diamonds"]
  suits.each {|x|
    number.each {|y|
    Deck << "#{y} of #{x}"}}
for x in 1..4 do
  DeckValue.concat(value)
  x+=1
end

Deck.zip(DeckValue) {|a,b| DeckDict[a.to_sym] = b}
end



def ShuffleCards
  DeckDict.each_key {|k| DictKey.append(k) }
  DictKey.shuffle!

end

$player = []
$dealer = []

def DealCards()
  y = 1
  for y in 1..4 do
    if y % 2 == 1
      $player.append(DictKey[y])
      DictKey.shift(1)
    else
      $dealer.append(DictKey[y])
      DictKey.shift(1)
    end

  end
puts $player
puts "\n"
end

def Gameplay()
  firstDeal = true
  if firstDeal == true
    DeckOfCards()
    firstDeal = false
  else continue
  end
  ShuffleCards()
  DealCards()
  playerpoints = []
  dealerpoints = []

#Need to add a discard pile for when the game ends to clear the dealer and players hand

  card = 1
  point = 0
  while card <= $player.length
    playerpoints += DeckDict.fetch_values($player[point])
    card += 1
    point += 1
  end

  Dcard = 1
  Dpoint = 0
  while Dcard <= $dealer.length
    dealerpoints += DeckDict.fetch_values($dealer[point])
    Dcard += 1
    Dpoint += 1
  end

  playerpoints.each {|x| $pointsInHand += x}
  dealerpoints.each {|y| $dealerPointsInHand += y}

  puts "player has #{$player} (#{playerpoints})"

  puts "dealer has #{$dealer[0]}, <other card hidden>"
 
  HorS = true
  while HorS == true do
  puts "Do you want to hit or stay?"
  HitOrStay = gets.chomp.to_s
   if HitOrStay === "hit"
    Hit()
   else
    HorS = false
   end

  $playerpoints > 21 ? puts "Player bust", StartGame() : continue 
  puts "Your cards are now #{$player} (#{playerpoints})"
  end
Dealer()

if pointsInHand > dealerPointsInHand
  puts "Player wins!"
  StartGame()
elsif pointsInHand < dealerPointsInHand
  puts "Dealer wins!"
  StartGame()
else pointsInHand == dealerPointsInHand
  puts "It's a tie!"
  StartGame()

puts "Deck has: #{DeckDict.length} cards left"

end

#Methods for the player and the dealer to hit
def PlayerHit()
  $player.append(DictKey[0])
  DictKey.shift(1)
  #$pointsInHand += $player.last
end
def DealerHit()
  $dealer.append(DictKey[0])
  DictKey.shift(1)
  #$DealerpointsInHand += $dealer.last
end

def Dealer()
  case $dealerPointsInHand
    when $dealerPointsInHand < 17
        DealerHit()
    else $dealerPointsInHand >= 17
      continue
    end
end

def StartGame()
  $player.clear()
  $dealer.clear()
  puts "Do you want to play a hand?[y/n]"
  start = gets.chomp.to_s
  start === "y" ? Gameplay() : exit!
end



StartGame()

puts DictKey.length
#puts DictKey
