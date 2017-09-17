require_relative 'sixteen_ppl/aspect'
require_relative 'sixteen_ppl/question'
require_relative 'sixteen_ppl/answer'
require_relative 'sixteen_ppl/personality'
require_relative 'sixteen_ppl/personality_finder'

personality_finder = SixteenPpl::PersonalityFinder.new
personality_finder.add_question :mind, -1, 'Acha cansativo ter um final semana inteiro de rolê?'
personality_finder.add_question :energy, +1, 'Precisa de profundidade nos assuntos?'
personality_finder.add_question :nature, -1, 'Resolve problemas base no raciocínio em vez de sentimentos?'
personality_finder.add_question :tactics, -1, 'É certinho, não lida bem com incerteza?'
personality_finder.add_question :identity, +1, 'Se obriga a ser foda naquilo que faz?'

puts personality_finder.discover