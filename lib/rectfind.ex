defmodule Rectfind do

  @doc """
  For the list of strings, where each string represents a row
  then return a list of ints where the int shows the number of
  non-empty cells
  """
  def column_counts(lst) do
    lst
      |> Enum.map(fn row->
          Enum.map(row, fn cell->
            case cell do
              "" -> 0
              _ -> 1
            end
          end) |> Enum.sum
        end)
  end

  def avg([_]), do: 0

  def avg(lst) do
    (lst |> Enum.sum()) / Enum.count lst
  end

  @doc """
  Find the start and end row for the rows that:
    - Have more than the average number of non-empty cells
  """
  def row_positions(lst) do
    counts = column_counts(lst)
    avg = avg(counts)

    res = counts
      |> Enum.map(fn x ->
            case x > avg do
              true -> 1
              false -> 0
            end
         end)
      |> Enum.filter(&(&1))

    start = Enum.find_index(res, &(&1 == 1))
    last = Enum.reverse(res) |> Enum.find_index(&(&1 == 1))

    {start, Enum.count(res) - last - 1}
  end

end
