defmodule Identicon.Image do
  defstruct hex: nil

  def get_color(image) do
    Enum.take image.hex, 3
  end
end
