defmodule Day2 do
  @spec solve() :: integer()
  def solve do
    read_input()
    |> Stream.map(&parse_line/1)
    |> Stream.filter(&validate_password/1)
    |> Enum.count()
  end

  @spec parse_line((String.t())) :: map()
  defp parse_line(line) do
    [range, char, password] = String.split(line)

    [low, high] = String.split(range, "-") |> Enum.map(&String.to_integer/1)
    char = String.trim(char, ":")
    password = String.graphemes(password)

    %{low: low, high: high, char: char, password: password}
  end

  @spec validate_password(map()) :: boolean
  defp validate_password(%{password: password, char: char, low: low, high: high}) do
    char_count =
      password
      |> Enum.filter(&(&1 == char))
      |> Enum.count()

    is_valid?(char_count, low, high)
  end

  @spec is_valid?(non_neg_integer(), non_neg_integer(), non_neg_integer()) :: integer()
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
