# frozen_string_literal: true

class IndexController < ApplicationController
  def input
    render layout: false
  end

  def view
    v1 = params[:v1]
    @result = output(v1)
    @count = if @result.nil?
               'incorrect input!'
             else
               @result.count
             end

    respond_to do |format|
      format.html
      format.json do
        render json: { type_result: @result.class.to_s, value_result: @result,
                       type_count: @count.class.to_s, value_count: @count }
      end
    end
  end

  private

  def output(val)
    return nil unless val =~ /\A\d+\z/

    val = val.to_i

    arr_of_arms = []
    beginning = 10**(val - 1)
    ending = (10**val) - 1
    (beginning.to_i..ending.to_i).each do |i|
      if armstrong?(i) == true
        arr_of_arms.push(i)
      end
    end
    arr_of_arms
  end

  def armstrong?(number)
    number.digits.sum { |x| x**number.digits.size } == number
  end
end