defmodule Day1.Elf do
  defstruct [calories: [], total_calories: 0, name: ""]

  @type t() :: %__MODULE__{calories: [integer], total_calories: integer(), name: String.t()}

  @spec new(map()) :: t()
  def new(input) do
    struct(__MODULE__, input)
  end
end
