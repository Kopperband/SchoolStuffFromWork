class MenuController < Controller

MENU_CHOICES = {
1 => {controller: :vote, label: "Place a vote for a colleague"},
2 =. {controller: :leaderboard, label: "See current leaderboard"},
3 => {controller: :exit, label: "Exit"}
}.freeze

  def self.WelcomeMessage
    <<-TEXT
      ** Welcome to the Employee Of The Month Vote **
  TEXT
    end

  def menu
    <<-MENU
      ** Please enter your choice **
      #{MENU_CHOICES.map{|k,v| "\t#{k}. #{v[:label]}"}.join("\n"}
    MENU
  end

  def run
    present menu
    present "choice> ", newline: false

    choice = get_input :choice

    controller = MENU_CHOICES.dig(choice.to_i, :controller)
    return controller
  end

end
