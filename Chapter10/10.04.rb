class WelcomeMessage
  countries = %w(fr jp eng de br)
  countries.each do |country|
    define_method("message_for_#{country}") do |argument|
      "Welcome to Ruby Fundamentals, this is a reader from #{argument}."
    end
  end
end

greeting = WelcomeMessage.new
puts gretting.message_for_fr("France")
puts gretting.message_for_jp("Japan")
puts gretting.message_for_eng("England")
puts gretting.message_for_de("Germany")
puts gretting.message_for_br("Brazil")
