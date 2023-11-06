Deck = []
#DeckDict is cards and there values
DeckDict = {}
DeckValue = []
DictKey = []
$pointsInHand = 0


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
  playerpoints = []
  card = 1

  point = 0
  while card <= $player.length
    playerpoints += DeckDict.fetch_values($player[point])
    card += 1
    point += 1
  end
  playerpoints.each {|x| $pointsInHand += x}
  puts playerpoints
  puts "test"
  puts $pointsInHand
  Hit()


end
def Hit()
  $player.append(DictKey[0])
  DictKey.shift(1)
  #$pointsInHand += $player.last
end

DeckOfCards()
ShuffleCards()
DealCards()
Gameplay()

puts DictKey.length
#puts DictKey
