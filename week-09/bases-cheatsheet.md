## Binary to Hex

1. Write out your hex numbers so you can easily consult them throughout the test:

- 1 = 1
- 2 = 2
- 3 = 3
- 4 = 4
- 5 = 5
- 6 = 6
- 7 = 7
- 8 = 8
- 9 = 9
- 10 = A
- 11 = B
- 12 = C
- 13 = D
- 14 = E
- 15 = F

2. Divide the binary number into groups of four from right to left (e.g. 11 | 1100 | 0101). If the leftmost grouping contains fewer than four numbers, add in zeros where there are blank spaces (so the above example becomes 0011 | 1100 | 0101).

3. From right to left, write a little 1 (or 'U' for 'units'), 2, 4, 8 above each column of each grouping.

GROUPING 1:

| 8 | 4 | 2 | U |
|---|---|---|---|
| 0 | 0 | 1 | 1 |


GROUPING 2:

| 8 | 4 | 2 | U |
|---|---|---|---|
| 1 | 1 | 0 | 0 |


GROUPING 3:

| 8 | 4 | 2 | U |
|---|---|---|---|
| 0 | 1 | 0 | 1 |




4. Add up each grouping. So our example above 0011 | 1100 | 0101 would become:

0011 = 3 (one '2' + one '1')
1100 = 12 (one '8' + one '4')
0101 = 5 (one '4' + one '1')

5. We have our three numbers 3, 12, 5. Now we need to convert those numbers to hex. Look at the list you created in step one above. 3 converted to hex = 3, 12 converted to hex = C, 5 converted to hex = 5.

6. So our hex number = 3C5

7. 11 1100 0101 in hex = 3C5.

8. Check your answer on the online converter calculator.

## Decimal to Binary

1. Look at the number you have to convert e.g. 300.

2. Write out a binary table (the largest number you'll need is the number immediately under the number you have to convert). So, in our example, we're looking for the number in the table immeidately less than 300, which is 256.

| 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | U |
|-----|-----|----|----|----|---|---|---|---|
|     |     |    |    |    |   |   |   |   |
|     |     |    |    |    |   |   |   |   |


3. Look at your columns above. Are there any 256s in 300? Yes. One. So put a '1' in the 256 column.

| 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | U |
|-----|-----|----|----|----|---|---|---|---|
|  1  |     |    |    |    |   |   |   |   |
|     |     |    |    |    |   |   |   |   |


4. But 300 minus 256 leaves 44 left over. Let's deal with that.


5. Are there any 128s in 44? No. 128 is bigger than 44. So put a zero in that column.

| 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | U |
|-----|-----|----|----|----|---|---|---|---|
|  1  |  0  |    |    |    |   |   |   |   |
|     |     |    |    |    |   |   |   |   |


6. Are there any 64s in 44? No. 64 is bigger than 44. So put a zero in that column.

| 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | U |
|-----|-----|----|----|----|---|---|---|---|
|  1  |  0  |  0 |    |    |   |   |   |   |
|     |     |    |    |    |   |   |   |   |

7. Are there any 32s in 44? Yes. One. So put a '1' in that column.

| 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | U |
|-----|-----|----|----|----|---|---|---|---|
|  1  |  0  |  0 |  1 |    |   |   |   |   |
|     |     |    |    |    |   |   |   |   |

8. Now we have 12 left over.

9. Are there any 16s in 12? No. 16 is bigger than 12. So put a zero in that column.


| 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | U |
|-----|-----|----|----|----|---|---|---|---|
|  1  |  0  |  0 |  1 |  0 |   |   |   |   |
|     |     |    |    |    |   |   |   |   |



10. Are there any 8s in 12? Yes. One. So put a '1' in that column.

| 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | U |
|-----|-----|----|----|----|---|---|---|---|
|  1  |  0  |  0 |  1 |  0 | 1 |   |   |   |
|     |     |    |    |    |   |   |   |   |


11. Now we have 4 left over over. Are there any 4s in 4? Yes. One. So put a '1' in that column.

| 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | U |
|-----|-----|----|----|----|---|---|---|---|
|  1  |  0  |  0 |  1 |  0 | 1 | 1 |   |   |
|     |     |    |    |    |   |   |   |   |

12. Now we have nothing left over! Great. So put a zero in the 2s column and Us column

| 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | U |
|-----|-----|----|----|----|---|---|---|---|
|  1  |  0  |  0 |  1 |  0 | 1 | 1 | 0 | 0 |
|     |     |    |    |    |   |   |   |   |


13. So, starting from the 256 column we have 1 0010 1100.

14. 300 decimal is 1 0010 1100 in binary.

## Decimal to Hex

1. Do decimal to binary as above.

2. Then do binary to hex as above.

3. Finished.


## Hex to decimal 

1. There's a relatively easy way to do hex to decimal. Again, binary will be the middle man.

2. Take your hex number (e.g. 4C3).

3. Split it up into its component parts: 4, C, 3. 

4. Convert 4 to binary:

| 8 | 4 | 2 | U |
|---|---|---|---|
| 0 | 1 | 0 | 0 |

5. Convert C to binary (remember C in hex is 12 in decimal - consult your table at the very top!):

| 8 | 4 | 2 | U |
|---|---|---|---|
| 1 | 1 | 0 | 0 |


6. Convert 3 to binary:

| 8 | 4 | 2 | U |
|---|---|---|---|
| 0 | 0 | 1 | 1 |


7. So you have: 0100, 1100, 0011.

8. Write out an extended base 2 columns-thingy (the size will depend on how many numbers you have - I fucked up here and added one more column than I needed to:

| 2048 | 1024 | 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | U |
|------|------|-----|-----|-----|----|----|----|---|---|---|---|
|      |      |     |     |     |    |    |    |   |   |   |   |


9. Take your binary from step 5 and plug it in:


| 2048 | 1024 | 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | U |
|------|------|-----|-----|-----|----|----|----|---|---|---|---|
|      |   1 	|  0  |  0  |  1  | 1  |  0 | 0  | 0 | 0 | 1 | 1 |
|      |      |     |     |     |    |    |    |   |   |   |   |


10. So 4C3 in binary = 1001 1000 0011.

11. Now to get from binary to decimal:

12. Just look at your table in number 9. We have:

- 1 * 1024
- 1 * 128
- 1 * 64
- 2 * 1
- 1 * 1

In other words, we have:

1024, 128, 64, 2, 1

Now you just need to add them together.

1024 + 128 + 64 + 2 + 1 = 1219

13. 4C3 converted to decimal = 1219.


## Decimal to octal

1. Draw up an octal table:

| 512 | 64 | 8 | 1 |
|-----|----|---|---|
|     |    |   |   |

2. Look at the decimal number you've been given to convert (e.g. 98)
3. Look for the first number on your octal table smaller than the number you've been given to convert (in this case 64)
3. How many 64s in 98? 1 with 34 left over (put the 1 aside)
4. How many 8s in 34? 4 with 2 left over (put the 4 aside)
5. How many 1s in 2? 2 with none left over (put the 2 aside)
6. Take the three numbers you've put aside (i.e. 1,4,2) and there's your answer. 98 in decimal is equal to 142 in octal.

## Binary to octal

1. This is a piece of piss.

2. Draw up a quick binary table.

| 4 | 2 | U |
|---|---|---|

3. Just say your number is 1100 1100 0111. Put the number into groups of three: 

110 011 000 111

4. Now plug each group of three into your binary table. Here's the first group done for you:

| 4 | 2 | U |
|---|---|---|
| 1 | 1 | 0 |
|   |   |   |

That gives you 6 for the first group, right? Repeat for the others.

You should have: 6, 3, 0, 7

5. And there's your answer 1100 1100 0111 in binary = 6307 in octal.

