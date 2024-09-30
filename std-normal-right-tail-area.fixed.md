---
title: Standard Normal Right Tail Area
params:
    z: 1.25
---



We have \(z = 1.25\). We want to find the chance of getting a z-value that is
greater than the given one.  

Here is the picture of the area we want. 

![A right tail area for \(z=1.25\)](https://statplosion-api-x5isouofzq-uk.a.run.app/stdrighttail?z=1.25)

We want the size of the shaded region to the right of \(z=1.25\).  

We will calculate this area using a spreadsheet and the **NORMSDIST** function.  

However since **NORMSDIST** calculates left tail areas, we need to use it
together with a trick. The trick uses the fact that: 

$$ \text{Left Tail Area} + \text{Right Tail Area} = 100\\% $$

So if **NORMSDIST** gives the left tail area, **1-NORMSDIST** gives the right
tail area.

So lets put our work into a spreadsheet:

- Type **z** in cell **A2** 
- Then type \(1.25\) into **B2**

|     |    column A    |    column B    |    column C    |
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      z         |   1.25        |                |
|  3  |                |                |                |
|  4  |                |                |                |


- Type **right area** in cell **A3** 
- Then type **=1.0-NORMSDIST(B2)** into **B3**

|     |    column A    |    column B    |    column C    |
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      z         |   1.25        |                |
|  3  |  right area    | =1.0-NORMSDIST(B2) |            |
|  4  |                |                |                |


Finally hit return and you should get this:

|     |    column A    |    column B    |    column C    |
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      z         |   1.25        |                |
|  3  |     right area | 0.1056498 |             |
|  4  |                |                |                |


To four decimal places this is \(0.1056\)

Sometimes we like to have it to the nearest percent and for that we have 
\(11\%\).
