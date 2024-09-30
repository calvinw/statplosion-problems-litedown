---
title: Normal Left Tail Area
params:
    mu: 42
    sigma: 12
    x: 53
---



We have \(x = 53\), \(\mu = 42\), and \(\sigma = 12\) . We want to find
the chance of \(x\) being less than \(53\) in this situation.

Here is a rough picture of the area we want. Its the shaded area to the left of
\(x=53\): 



![Left tail area for \(x=53\), \(\mu=42\), and \(\sigma=12\)](https://statplosion-api-x5isouofzq-uk.a.run.app/lefttail?x=53&mu=42&sigma=12)

Our approach will be to find the z-value from the given info, then use
**NORMSDIST** to calculate the left tail area using a spreadsheet.

This works because the area above is the same as the left tail area using 
the \(z\)-value we get for \(x=53\):



We will use the \(z\)-value formula: 

$$
z = \frac{x-\mu}{\sigma}
$$

But instead of doing this by hand we will use our spreadsheet to help us with this.

We will put the numerical \(x\), \(\mu\) and \(\sigma\) values that we have in column
B and labels for these in column A.  

- Type the label **x** in cell **A2** 
- Type \(53\) in cell **B2** 
- Type the label **mu** in cell **A3** 
- Type \(42\) in cell **B3** 
- Type the label **sigma** in cell **A4** 
- Type \(12\) in cell **B4** 

|     |    column A    |    column B    |    column C    |
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      x         |   53        |                |
|  3  |      mu        |   42       |                |
|  4  |      sigma     |   12    |                |
|  5  |                |                |                |


- Use the formula \(z=\frac{x-\mu}{\sigma}\) in cell **B5** using the cell
  references for \(x\), \(\mu\), and \(\sigma\) 

|     |    column A    |    column B    |    column C    | 
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      x         |   53        |                |
|  3  |      mu        |   42       |                |
|  4  |      sigma     |   12    |                |
|  5  |      z         | =(B2-B3)/B4    |                |
|  6  |                |                |                |

- On pressing Enter, the result looks like this 

|     |    column A    |    column B    |    column C    | 
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      x         |   53        |                |
|  3  |      mu        |   42       |                |
|  4  |      sigma     |   12    |                |
|  5  |      z         |   0.9166667        |                |
|  6  |                |                |                | 


- Now use the **NORMSDIST** function using the \(z\) we just found

|     |    column A    |    column B    |    column C    |    
|-----|----------------|----------------|----------------|
|  1  |                |                |                | 
|  2  |      x         |   53        |                |
|  3  |      mu        |   42       |                |
|  4  |      sigma     |   12    |                |
|  5  |      z         |   0.9166667        |                |
|  6  |     left area  | =NORMSDIST(B5) |                |
|  7  |                |                |                |

- The result is this 

|     |    column A    |    column B    |    column C    |   
|-----|----------------|----------------|----------------|
|  1  |                |                |                |
|  2  |      x         |   53        |                |
|  3  |      mu        |   42       |                |
|  4  |      sigma     |   12    |                |
|  5  |      z         |   0.9166667        |                |
|  6  |     left area  |   0.8203413     |                |
|  7  |                |                |                |

To four decimal places this is \(0.8203\)

Sometimes we like to have it to the nearest percent and for that we have 
\(82\%\).
