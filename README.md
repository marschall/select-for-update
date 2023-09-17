

Logical Acqusition Order
------------------------

| S#1 | S#2 |
|-----|-----|
|   1 |     |
|   2 |     |
|   3 |     |
|   4 |   4 |
|   5 |   5 |
|   6 |   6 |
|     |   7 |
|     |   8 |
|     |   9 |


Physical Row Order
------------------

Locking

|   | S#1    | S#2     |
|---|--------|---------|
| 6 | locked | waiting |
| 1 | locked |         |
| 2 | locked |         |
| 3 | locked |         |
| 4 | locked | waiting |
| 5 | locked | waiting |
| 7 |        | waiting |
| 8 |        | waiting |
| 9 |        | waiting |

-> S#1 finishes before S#2 as it first locks row 6 blocking S#2 from making progres


|   | S#1     | S#2    |
|---|---------|--------|
| 1 | locked  |        |
| 2 | locked  |        |
| 3 | locked  |        |
| 4 | waiting | locked |
| 5 | waiting | locked |
| 6 | waiting | locked |
| 7 |         | locked |
| 8 |         | locked |
| 9 |         | locked |


-> S#2 finishes before S#1 as it first locks row 4 blocking S#1 from making progres
