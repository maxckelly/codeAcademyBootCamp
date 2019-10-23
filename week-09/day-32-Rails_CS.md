# Max's Notes

### Logic 

- Logic is built around implication. Think of logic as if statements. For example:
- The below are your logical statements
  - a) The sky is overcast 
  - b) The sun is not visible 

- if the sky is overcast (a) then the sun is not visible. (b) that means that is true. 
  - If (a) is true then (b) is true: a => b
  - The results of (a) implies (b)
```
if sky == "overcast"
  return "The sun is not visible"
end
```
```
The below is your truth statements

1 = true 
0 = false

| a | b |   | a | => | b |
|---|---|---|---|----|---|
| 0 | 0 |   |      1     |
| 0 | 1 |   |      1     |
| 1 | 0 |   |      0     |
| 1 | 1 |   |      1     |

```

### Main operators 
- AND
- OR
- NOT
- XOR
- NAND
- NOR
- NXOR

#### NOT
- Not is true => false and false => true

1 = true 
0 = false

| a | b |
|---|---|
| 1 | 0 |
| 0 | 1 |

#### AND
- Logical symbol is "∧"

1 = true 
0 = false

|A B| ∧ |
|---|---|
|0 0| 0 |
|0 1| 0 |
|1 0| 0 |
|1 1| 1 |

- NanD (⊼ NAND)
- NAND is the opposite of the AND

|A B| NAND |
|---|---|
|0 0| 1 |
|0 1| 1 |
|1 0| 1 |
|1 1| 1 |

#### OR 

- The symbol for an or is "∨"
- If one of the options is true then result is true

1 = true 
0 = false

|A B|  a v b |
|---|---|
|0 0| 0 |
|0 1| 1 |
|1 0| 1 |
|1 1| 1 |

#### NOR is the opposite

1 = true 
0 = false

|A B|  a v b |
|---|---|
|0 0| 1 |
|0 1| 0 |
|1 0| 0 |
|1 1| 0 |

#### XOR - Exclusive OR

- The symbol for the operator ⊕
- Only one can be true

1 = true 
0 = false

|A B| a ⊕ b |
|---|---|
|0 0| 1 |
|0 1| 0 |
|1 0| 0 |
|1 1| 1 |

#### NXOR

1 = true 
0 = false

|A B| a ⊕ b |
|---|---|
|0 0| 1 |
|0 1| 0 |
|1 0| 0 |
|1 1| 1 |