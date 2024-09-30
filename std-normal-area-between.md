---
title: Standard Normal Area Between
params:
    z1: 0.4
    z2: 1.1
---



We have $z_1 = 0.4$ and $z_2 = 1.1$. We want to find the chance of
getting a z-value that is between the two z-values.  

Here is the picture of the area we want. 

![A area between z1=0.4 and z2=1.1](https://statplosion-api-x5isouofzq-uk.a.run.app/stdlefttail?z=1.1)

We want the size of the shaded region between z1=0.4 and z2=1.1

We can calculate this area using a spreadsheet and the **NORMSDIST** function
which gives left tail areas for the two z-values. 

But then since we want the area between the two z-values we do this:
- We calcute the left tail area for "right most" z-value, which is $z2$
- We calcute the left tail area for "left most" z-value, which is $z1$
- We subtract the two left tail areas to get the area between them

- Type **z1** in cell **A2** 
- Put $0.4$ in cell **A2** 
- Type **z2** in cell **A3** 
- Put $1.1$ in cell **A3** 

|     |    column A    |    column B    |    column C    |
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      z1        |   0.4       |                |
|  3  |      z2        |   1.1       |                |
|  4  |                |                |                |
|  5  |                |                |                |

- Type **area1** in cell **A4** 
- Type **area2** in cell **A5** 
- Then type **=NORMSDIST(B2)** into **B3**

|     |    column A    |    column B    |    column C    |
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      z1        |   0.4       |                |
|  3  |      z2        |   1.1       |                |
|  4  |     area1      | =NORMSDIST(B2) |                |
|  5  |     area2      | =NORMSDIST(B3) |                |
|  4  |                |                |                |
|  5  |                |                |                |

|     |    column A    |    column B    |    column C    |
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      z1        |   0.4       |                |
|  3  |      z2        |   1.1       |                |
|  4  |     area1      |   0.6554217    |                |
|  5  |     area2      |   0.8643339    |                |
|  6  |                |                |                |
|  7  |                |                |                |


|     |    column A    |    column B    |    column C    |
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      z1        |   0.4       |                |
|  3  |      z2        |   1.1       |                |
|  4  |     area1      |   0.6554217    |                |
|  5  |     area2      |   0.8643339    |                |
|  6  |   area between |    =B5-B4      |                |
|  7  |                |                |                |


|     |    column A    |    column B    |    column C    |
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      z1        |   0.4       |                |
|  3  |      z2        |   1.1       |                |
|  4  |     area1      |   0.6554217    |                |
|  5  |     area2      |   0.8643339    |                |
|  6  |   area between |0.2089122|                |
|  7  |                |                |                |


To four decimal places this is $0.2089$

Sometimes we like to have it to the nearest percent and for that we have 
$21\%$.
