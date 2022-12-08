defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  test "given test input calculates the expected result" do
    assert Day3.run("test_input.txt") == 157
  end

  test "given more information calculates the correct score" do
    assert Day3.run2("test_input.txt") == 70
  end
end
