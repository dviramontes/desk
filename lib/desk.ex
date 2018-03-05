defmodule Desk.CLI do
  @moduledoc """
  Various utils for ~/Desktop management
  """

  @home "#{System.user_home()}/Desktop/"
  @pattern "Screen Shot"

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
        |> Enum.reject(&File.dir?/1)
        |> Enum.filter(fn file ->
          case file do
            "#{@home}#{@pattern}" <> _ -> true
            _ -> false
          end
        end)
        |> Enum.map(&File.rm/1)

      {:error, error} ->
        IO.puts("#{error}: Screenshot directory not found")
    end
  end

  def main(_args) do
    rm_ss()
  end
end
