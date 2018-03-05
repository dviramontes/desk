defmodule Desk do
  @moduledoc """
  Various utils for ~/Desktop management
  """

  @home "#{System.user_home()}/Desktop/"

  @doc """
  Removes stale Screenshots

  ## Examples

      iex> Desk.rm_ss
      [:ok]

  """
  def rm_ss() do
    case File.ls(@home) do
      {:ok, files} ->
        Enum.map(files, &(@home <> &1))
        |> Enum.reject(&File.dir?(&1))
        |> Enum.filter(fn file ->
          case file do
            "#{@home}Screen Shot " <> _ -> true
            _ -> false
          end
        end)
        |> Enum.map(&File.rm(@home <> &1))

      {:error, error} ->
        IO.puts("#{error}: Screenshot directory not found")
    end
  end
end
