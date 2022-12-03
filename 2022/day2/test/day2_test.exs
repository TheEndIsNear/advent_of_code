defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "given test input calculates the expected result" do
    assert Day2.run("test_input.txt") == 15
  end

  test "given more information calculates the correct score" do
    assert Day2.run2("test_input.txt") == 12
  end
end
