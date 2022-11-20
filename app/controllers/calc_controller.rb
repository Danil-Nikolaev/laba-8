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

  def numeric(num)
    !Float(num).nil?
  rescue StandardError
    false
  end

  def view
    v1 = params[:v1]
    v2 = params[:v2]
    if numeric(v1) && numeric(v2)
      v1 = v1.to_i
      v2 = v2.to_i
      @result_one = evklid(v1, v2)
      @result_two = (v1 * v2) / @result_one
    else
      @result_one = 'Unknow'
      @result_two = 'Unknow'
    end
  end
end
