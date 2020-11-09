require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    def included?(guess, grid)
      guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
    end

  def message(attempt, grid, time)
    if included?(attempt.upcase, grid)
      if english_word?(attempt)
        "well done"
      else
        "not an english word"
      end
    else
      "not in the grid"
    end
  end

    def english_word?(word)
      response = open("https://wagon-dictionary.herokuapp.com/#{word}")
      json = JSON.parse(response.read)
    return json['found']
    end
  end
end
