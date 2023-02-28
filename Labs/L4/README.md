AArch64 code that does the following:

Step 1. Convert szX and szY from ASCII to an integer using the external function called ascint64 and store the result into dbX and dbY. szX holds the value "10" and szY holds the value "szY".
Step 2. Create a new variable dbSum (word), and retrieve dbX and dbY from memory, adding them together and storing the result into dbSum.
Step 3. Now we have to convert dbSum from a quad to ascii for printing. We will use the int64asc external function.
Step 5. Finally, we will use the external function putstring to display the following output: `10 + 15 = 25`

Here is the starter code containing the .data variables: 
```
.section .data
    szX: .asciz "10"
    szY: .asciz "15"
    dbX: .quad 0
    dbY: .quad 0
    dbSum: .quad 0
```