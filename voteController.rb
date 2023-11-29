class VoteController < Controller
  attr_accessor :voter, :votee

  def run
    get_input :voter, "Whats your name? "
    get_input :votee, "Who do you want to vote for? "

    self.votingMachine.recordVote(@voter, @votee)

    log "Vote Recorded!"
  end
end
