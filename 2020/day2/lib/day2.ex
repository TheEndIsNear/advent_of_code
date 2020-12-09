defmodule Day2 do
  def solve do
    read_input()
    |> Stream.map(&parse_line/1)
    |> Stream.filter(&validate_password/1)
    |> Enum.count()
  end

  def parse_line(line) do
    [range, char, password] = String.split(line)

    [low, high] = String.split(range, "-") |> Enum.map(&String.to_integer/1)
    char = String.trim(char, ":")
    password = String.graphemes(password)

    %{low: low, high: high, char: char, password: password}
  end

  def validate_password(%{password: password, char: char, low: low, high: high}) do
    char_count =
      password
      |> Enum.filter(&(&1 == char))
      |> Enum.count()

    is_valid?(char_count, low, high)
  end

  defp is_valid?(char_count, low, high) when char_count >= low and char_count <= high, do: true
  defp is_valid?(_, _, _), do: false

  @spec read_input() :: list(integer())
  defp read_input do
    "lib/input.txt"
    |> File.read!()
    |> String.split("\n")
    |> Enum.filter(&(&1 != ""))
  end
end
