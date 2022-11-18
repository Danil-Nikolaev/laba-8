class CalcController < ApplicationController
  def input
  end

  def evklid(num_1, num_2)
    while num_1 != 0 && num_2 != 0
      if num_1 >= num_2 then
        num_1 %= num_2
      else num_2 %= num_1
      end
    end
    return num_1 if num_1 != 0

    num_2
  end

  def numeric(num)
    Float(num) != nil rescue false
  end

  def view
    v1, v2 = params[:v1], params[:v2]
    if numeric(v1) && numeric(v2) then
      v1 = v1.to_i
      v2 = v2.to_i
      @result_1 = evklid(v1, v2)
      @result_2 = (v1 * v2) / @result_1
    else @result_1,@result_2 = 'Unknow', 'Unknow'
    end
  end
end
