defmodule Roman do
  def digit(number) do
    cond do
      number >= 1000 ->
        "M" <> digit(number - 1000)
      number >= 900 ->
        "CM" <> digit(number - 900)
      number >= 500 ->
        "D" <> digit(number - 500)
      number >= 400 ->
        "CD" <> digit(number - 400)
      number >= 100 ->
        "C" <> digit(number - 100)
      number >= 90 ->
        "XC" <> digit(number - 90)
      number >= 50 ->
        "L" <> digit(number - 50)
      number >= 40 ->
        "XL" <> digit(number - 40)
      number >= 10 ->
        "X" <> digit(number - 10)
      number >= 9 ->
        "IX" <> digit(number - 9)
      number >= 5 ->
        "V" <> digit(number - 5)
      number >= 4 ->
        "IV" <> digit(number - 4)
      number >= 1 ->
        "I" <> digit(number - 1)
      true ->
        ""
    end
  end

  def next_digit(number) do
      number
      |> digit
      |> String.codepoints
  end

  def convert(decimal) when is_integer(decimal) and decimal > 0 do
    decimal
    |> next_digit
    |> Enum.join("")
    |> String.downcase
    |> String.to_atom
  end

  def map() do
    for x <- (1..1000), into: %{} do
      {convert(x), x}
    end
  end
end
