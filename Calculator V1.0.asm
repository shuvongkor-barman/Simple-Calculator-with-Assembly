TITLE: A simple Calculator

.MODEL SMALL
.STACK 100H


.DATA

INTRO DB "   Calculator v1.0",10,13
          DB "---------------------------------",10,13, 
          DB "- Enter '+' For Addition        -",10,13
          DB "- Enter '-' For Subtraction     -",10,13
          DB "- Enter '*' For Multiplication  -",10,13
          DB "- Enter '/' For Division        -",10,13
          DB "- Enter '2' For Square          -",10,13
          DB "- Enter 'y' For EXIT            -",10,13          
          DB "---------------------------------",10,13, "$"         

CHOICE DB 10,13, "Enter Your CHOICE [+ - * / 2 y]",10,13,'$'    
NUM1 DB "Enter First Number: $"
NUM2 DB "Enter Second Number: $"
NUM3 DW ?
NUM4 DW ?
NUM5 DB "Enter a Number: $"
Quotient DB "Quotient: $" 
Remainder DB "Remainder: $"

ADD_MSG DB " Addition Running",10,13, "$"
SUB_MSG DB " Substracion Running",10,13, "$"
MUL_MSG DB " Multiplication Running",10,13, "$"
DIV_MSG DB " Division Running",10,13, "$"
SQUARE_MSG DB " SQUARE Running",10,13, "$"
RESULT DB "Result is: $"            
NEWLINE DB 10,13, "$"

.CODE

MAIN PROC
    
    
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, INTRO
    INT 21H
    
    
    
LOOPER:   
    
    
    MOV AH, 9
    LEA DX, CHOICE
    INT 21H
    
    
    
    
    MOV AH,1
    INT 21H
    
    CMP AL, "+"
    JE ADDER
    
    CMP AL, "-"
    JE SUBER    
    
    CMP AL, "*"
    JE MULER    
    
    CMP AL, "/"
    JE DIVER    
    
    CMP AL, "2"
    JE SQUARE
    
    CMP AL, "y"
    JE EXIT
    CMP AL, "Y"
    JE EXIT   
    
    
    ADDER:
        
        MOV AH,9
        LEA DX, ADD_MSG
        INT 21H
        LEA DX, NEWLINE
        INT 21H
        LEA DX, NUM1
        INT 21H
        MOV AH,1
        INT 21H
        
        MOV BX, AX
        
        MOV AH,9
        LEA DX, NEWLINE
        INT 21H
        LEA DX, NUM2
        INT 21H
        
        MOV AH,1
        INT 21H
        
        
        
        ADD AX, BX
        MOV AH, 0
        AAA
        
        ADD AL, 48
        ADD AH, 48
        MOV BX, AX
        

        
        MOV AH,9
        LEA DX, NEWLINE
        INT 21H
        LEA DX, RESULT
        INT 21H
        
        MOV AH,2
        MOV DL, BH
        INT 21H
     
        MOV AH,2
        MOV DL, BL
        INT 21H
        
        JMP LOOPER
    
    
    
    SUBER:        

        MOV AH,9
        LEA DX, SUB_MSG
        INT 21H
        LEA DX, NEWLINE
        INT 21H
        LEA DX, NUM1
        INT 21H
        MOV AH,1
        INT 21H
        
        MOV BL, AL
        
        MOV AH,9
        LEA DX, NEWLINE
        INT 21H
        LEA DX, NUM2
        INT 21H
        
        MOV AH,1
        INT 21H
        
        SUB BL, AL
        ADD BL, 48
        
        MOV AH,9
        LEA DX, NEWLINE
        INT 21H
        LEA DX, RESULT
        INT 21H
        MOV AH,2
        MOV DL, BL
        INT 21H
        
        JMP LOOPER
    
    
    MULER:

        MOV AH,9
        LEA DX, MUL_MSG
        INT 21H
        LEA DX, NEWLINE
        INT 21H
        LEA DX, NUM1
        INT 21H
        
        MOV AH,1                    
        INT 21H
        
        
        SUB AX, 48
        MOV NUM3, AX

        
        MOV AH,9
        LEA DX, NEWLINE
        INT 21H
        LEA DX, NUM2
        INT 21H
        
        MOV AH,1                  
        INT 21H
        
        SUB AL, 48
        MOV NUM4, AX
        
        
        MOV BX, NUM3
        MOV BH, 0
        MOV AX, NUM4
        MOV AH, 0
        
        MUL BL
        AAM
        
        ADD AH, 48
        ADD AL, 48
        
        MOV BX, AX
        
        
        MOV AH,9
        LEA DX, NEWLINE
        INT 21H
        LEA DX, RESULT
        INT 21H
        
        MOV AH,2
        MOV DL, BH
        INT 21H
     
        MOV AH,2
        MOV DL, BL
        INT 21H
        
        JMP LOOPER
    
    
    DIVER:  
    
        MOV AH,9
        LEA DX, DIV_MSG
        INT 21H
        LEA DX, NEWLINE
        INT 21H
        LEA DX, NUM1
        INT 21H
        
        MOV AH,1                   
        INT 21H
        
        
        SUB AX, 48
        MOV NUM3, AX

        
        MOV AH,9
        LEA DX, NEWLINE
        INT 21H
        LEA DX, NUM2
        INT 21H
        
        MOV AH,1               
        INT 21H
        
        SUB AL, 48
        MOV NUM4, AX
        
        
        MOV AX, NUM3
        MOV AH, 0
        MOV BX, NUM4
        MOV BH, 0
        
        DIV BL
        
        CMP AH, 0
        JNE FRACTION
 
        
        ADD AH, 48
        ADD AL, 48
        
        MOV BX, AX
        
        
        MOV AH,9
        LEA DX, NEWLINE
        INT 21H
        LEA DX, RESULT
        INT 21H
        
        MOV AH,2
        MOV DL, BH
        INT 21H
     
        MOV AH,2
        MOV DL, BL
        INT 21H
        JMP LOOPER
        
    
    
     FRACTION:
                
        ADD AH, 48
        ADD AL, 48
        
        MOV BX, AX
        
        MOV AH,9
        LEA DX, NEWLINE
        INT 21H
        LEA DX, Quotient
        INT 21H
        
                
        MOV AH,2
        MOV DL, BL
        INT 21H
        
        MOV AH,9
        LEA DX, NEWLINE
        INT 21H
        
        LEA DX, Remainder
        INT 21H
     
        MOV AH,2
        MOV DL, BH
        INT 21H
        
     JMP LOOPER   
     
    
    
    SQUARE: 
    
        MOV AH,9
        LEA DX, SQUARE_MSG
        INT 21H
        LEA DX, NEWLINE
        INT 21H
        LEA DX, NUM5
        INT 21H
        
        MOV AH,1             
        INT 21H
        
        MOV AH, 0
        SUB AX, 48
        
        MUL AX
        AAM
        
        ADD AH,48
        ADD AL, 48
        
        
        MOV BX, AX
        
        MOV AH,9
        LEA DX, NEWLINE
        INT 21H
        LEA DX, RESULT
        INT 21H
        
        MOV AH,2
        MOV DL, BH
        INT 21H
     
        MOV AH,2
        MOV DL, BL
        INT 21H
        JMP LOOPER
    
        
    
    EXIT:
            MOV AH, 4CH
            INT 21H
                   
                   
    
    
              
    
    
    
    
    MAIN ENDP
   
    END MAIN
