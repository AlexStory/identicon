defmodule Identicon.Image do
  defstruct hex: nil, color: nil, grid: nil

  def get_color(image) do
    Enum.take(image.hex, 3)
  end
end
