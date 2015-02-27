### A stupidly simple, and occassionally effective way of finding the data in a CSV.

... where that CSV came from an Excel file which somebody decorated with lots of human-readable, but not computer-readable decoration.

Calling

```
    # Find the start and item index of the data
    # s - The first row where useful data probably appears
    # e - The last row containing useful data
    # s and e are obviously inclusive
    {s, e} = Rectfind.row_positions(list_of_lists)
```
