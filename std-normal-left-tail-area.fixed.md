---
title: Standard Normal Left Tail Area
params:
    z: 1.25
---



We have \(z = 1.25\). We want to find the chance of getting a z-value that is
smaller than the given one.  

Here is the picture of the area we want. 

![A left tail area for \(z=1.25\)](https://statplosion-api-x5isouofzq-uk.a.run.app/stdlefttail?z=1.25)

We want the size of the shaded region to the left of \(z=1.25\).  

We will calculate this area using a spreadsheet and the **NORMSDIST** function
which gives left tail areas for z-values. 

- Type **z** in cell **A2** 
- Then type \(1.25\) into **B2**

|     |    column A    |    column B    |    column C    |
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      z         |   1.25        |                |
|  3  |                |                |                |
|  4  |                |                |                |


- Type **left area** in cell **A3** 
- Then type **=NORMSDIST(B2)** into **B3**

|     |    column A    |    column B    |    column C    |
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      z         |   1.25        |                |
|  3  |     left area  | =NORMSDIST(B2) |                |
|  4  |                |                |                |


Finally hit return and you should get this:

|     |    column A    |    column B    |    column C    |
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      z         |   1.25        |                |
|  3  |     left area  | 0.8943502263   |                |
|  4  |                |                |                |


To four decimal places this is \(0.8944\)

Sometimes we like to have it to the nearest percent and for that we have 
\(89\%\).
