class VotingMachine
    attr_reader :month, :year, :results

  def initailize(month, year)
    @month = month
    @year = year
    @results = {}
  end

  def recordVote(voter, votee)
    raise InvalidVote unless validVote?(voter, votee)
    results[votee] ||= 0
    results[votee] += 1
  end

  def sortedResults()
    results.sort_by(&:last).reverse
  end

  private
  def validVote?(voter, votee)
    return false if [voterr, votee].any?{|v| v.nil? || v == ""}
    voter.to_s.downcae != votee.downcase.to_s
  end
end
