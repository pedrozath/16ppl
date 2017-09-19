require 'yaml'
require 'rubygems'
require 'bundler/setup'
require 'pry'

require_relative 'sixteen_ppl/trait'
require_relative 'sixteen_ppl/aspect'
require_relative 'sixteen_ppl/question'
require_relative 'sixteen_ppl/answer'
require_relative 'sixteen_ppl/personality'
require_relative 'sixteen_ppl/personality_finder'

pf = SixteenPpl::PersonalityFinder.new

YAML.load_file('config/questions.yml').each do |trait, question_category|
  question_category.each do |category_name, questions|
    questions.each do |question|
      pf.add_question SixteenPpl::Trait[trait.to_sym], category_name, question
    end
  end
end

puts pf.discover