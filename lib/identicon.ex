defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(image) do
    matrix =
      image.hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_list/1)

    %Identicon.Image{image | grid: matrix}
  end

  defp mirror_list([a,b,c]), do: [a, b, c, b, a]

  def pick_color(%Identicon.Image{hex: [r, g, b | _]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    hex =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end
end
