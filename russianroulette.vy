players: public(DynArray[address,100])
losers: public(DynArray[address,100])
odds: public(uint256)
playersTurn: public(uint256)
creator: address

#constructor
#set the creator to the contract creator
@external
def russianroulette(creatorAddress: address):
    self.creator = creatorAddress
    self.playersTurn = 0

#setOdds (uint256 oneInThisMany)
#behavior:
#if the contract creator is executing this method
#sets odds to input 
@external
def setOdds(oneInThisMany: uint256):
    if msg.sender == self.creator:
        self.odds = oneInThisMany

#addPlayer (address Player)
#checks if player has lost
#checks if player is already playing
#adds to players
@external
def addPlayer(Player: address):
    assert self.isALoser(Player)
    assert Player in self.players
    self.players.append(Player)



#lose (address Player)
#access: make sure this is only internally callable
#behavior:
#clears the whole players list
#adds Player to the losers list
@internal
def lose (Player: address):
    temp: uint256 = 100
    self.losers.append(Player)
    for i in range(100):
        self.players.pop()
        break



#random ()
#behavior: pics a random number between 1 and the 'odds' value
@internal
def random() -> uint256:
    return 1

#play ()
#behavior:
#rolls a random number using Random()
#grab the next player address to play
#if number is 1
#call Lose on the address
#if not
#set the playersTurn to the next play index
@external
def play():
    i: uint256 = self.random()
    current: address = self.players[self.playersTurn]
    if i == 1:
        self.lose(current)
    if i != 1:
        self.playersTurn+=1

#isALoser (address person)
#returns whether or not this address is in the losers list
@internal
def isALoser(person: address) -> bool:
    return person in self.losers
