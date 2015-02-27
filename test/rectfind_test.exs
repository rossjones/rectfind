defmodule RectfindTest do
  use ExUnit.Case

  def pathological_csv, do: parsed(["0,2,,,,,,,"])

  def small_csv do
    parsed(["0,2,,,,,,,",
      ",,,5,6,,,,",
      "1,2,3,4,5,7,,8,9",
      "2,2,3,4,5,7,,8,9"])
  end

  def small_csv_with_footer do
    parsed(["0,2,,,,,,,",
       ",,,5,6,,,,",
       "1,2,3,4,5,7,,8,9",
       "2,2,3,4,5,7,,8,9",
       "0,2,,,,,,,",
       ])
  end

  def parsed(l) do
    l |> Enum.map(&(String.split(&1, ",")))
  end

  def large_csv do
    File.read!("calls.csv") |> ExCsv.parse! |> Enum.to_list
  end

  test "get column counts from small csv" do
    assert Rectfind.column_counts(small_csv) == [2,2,8,8]
  end

  test "get avg length" do
    assert Rectfind.avg(Rectfind.column_counts(small_csv)) == 5
  end

  test "get most complete row indexes" do
    assert Rectfind.row_positions(small_csv) == {2,3}
    assert Rectfind.row_positions(small_csv_with_footer) == {2,3}
    assert Rectfind.row_positions(pathological_csv) == {0, 0}
  end

  test "large csv output" do
    largish = large_csv
    a = Rectfind.avg(Rectfind.column_counts(largish))
    assert a > 9
    assert a < 10
    assert Rectfind.row_positions(largish) == {16, 60}
  end

end
