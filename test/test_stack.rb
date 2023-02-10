# frozen_string_literal: true

require "test_helper"

class TestStack < Minitest::Test
  def test_it_accepts_a_height
    stack = Scarpe::Stack.new(height: 25) do
      "fishes that flop"
    end

    assert(stack.to_html.include?("height:25px"))
  end

  def test_it_can_have_a_background
    stack = Scarpe::Stack.new do
      background "red"
    end

    assert(stack.to_html.include?("background:red"))
  end

  def test_it_can_have_a_border
    stack = Scarpe::Stack.new do
      border "#DDD".."#AAA", strokewidth: 10, curve: 12
    end

    assert(stack.to_html.include?("border-style:solid;"))
    assert(stack.to_html.include?("border-width:10px;"))
    assert(stack.to_html.include?("border-image:linear-gradient(45deg, #DDD, #AAA) 1;"))
  end

  def test_it_can_have_a_gradient_border_and_background
    stack = Scarpe::Stack.new do
      border "#DDD".."#AAA"
      background "#AAA".."#DDD"
    end

    assert(stack.to_html.include?("border-image:linear-gradient(45deg, #DDD, #AAA) 1;"))
    assert(stack.to_html.include?("background:linear-gradient(45deg, #AAA, #DDD);"))
  end
end