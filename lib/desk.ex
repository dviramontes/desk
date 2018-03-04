defmodule Desk do

  @moduledoc """
  Various utils for ~/Desktop management
  """

  @home "/Users/mmm/Desktop/"

  @doc """
  Removes stale Screenshots

  ## Examples

      iex> Desk.rm_ss
      [:ok]

  """
  def rm_ss() do
    case File.ls(@home) do
      {:ok, files} -> Enum.filter(files, fn(file) ->
        not(File.dir?(@home <> file))
      end) |> Enum.filter(fn(s) ->
        case s do
          "Screen Shot " <> _ -> true
          _ -> false
        end
      end) |> Enum.map(fn(ss) -> File.rm(@home <> ss) end)
      {:error, error} -> IO.puts "#{error}: Screenshot directory not found"
    end
  end
end
