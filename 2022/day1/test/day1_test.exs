defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  alias Day1

  test "given the sample input computes the expected result" do
    result = Day1.run("test_input.txt")

    assert result == [
             %Day1.Elf{calories: [7000, 8000, 9000], total_calories: 24000, name: "Elf 3"},
             %Day1.Elf{calories: [5000, 6000], total_calories: 11000, name: "Elf 2"},
             %Day1.Elf{calories: [10000], total_calories: 10000, name: "Elf 4"},
             %Day1.Elf{calories: [1000, 2000, 3000], total_calories: 6000, name: "Elf 0"},
             %Day1.Elf{calories: [4000], total_calories: 4000, name: "Elf 1"}
           ]

    assert Day1.top_elf_calories(result) == 24_000

    assert Day1.top_three_elf_calories_combined(result) == 45_000
  end
end
