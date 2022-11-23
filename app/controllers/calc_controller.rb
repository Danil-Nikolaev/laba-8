# frozen_string_literal: true

# This class contoller for work our application
class CalcController < ApplicationController
  def input; end

  def evklid(num_one, num_two)
    while num_one != 0 && num_two != 0
      if num_one >= num_two
        num_one %= num_two
      else
        num_two %= num_one
      end
    end
    return num_one if num_one != 0

    num_two
  end

  def view
    v1 = params[:v1]
    v2 = params[:v2]
    digit = true
    if /^\d$/.match(v1).nil? || /^\d$/.match(v2).nil?
      @result_one = 'Unknow'
      @result_two = 'Unknow'
      digit = false
    end
    return unless digit

    v1 = v1.to_i
    v2 = v2.to_i
    @result_one = evklid(v1, v2)
    @result_two = (v1 * v2) / @result_one
  end
end
