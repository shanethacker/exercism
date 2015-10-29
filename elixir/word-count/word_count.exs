defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  def count(words) when is_list(words) do
    Enum.reduce(words, %{}, &update_count/2)
  end

  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
      |> String.downcase
      |> String.replace(~r/[^[:alnum:]\-]/u, " ")
      |> String.split
      |> count
  end

  def update_count(word, acc) do
    Map.update(acc, word, 1, fn(val) -> val + 1 end)
  end
end
