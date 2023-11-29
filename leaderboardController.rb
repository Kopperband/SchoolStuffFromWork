class LeaderboardController < Controller
  def run
    sorted_results = votingMachine.sorted_results
    sorted_results.each do |person, count|
      log "#{person}: #{count}"
    end
  end
end
