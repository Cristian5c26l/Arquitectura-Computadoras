.data            # Zona de datos
vector: .word 0 30 0 0 0
#####
      .text      # Zona de instrucciones
main: li $v0, 1  # Llamada al sistema para print int
      
      lw $a0, vector ($0)
      addi $s0, $a0, 0
      syscall
      
      lw $a0, vector + 4($0)
      addi $s1, $a0, 0
      syscall
      
      lw $a0, vector + 8($0)
      addi $s2, $a0, 0
      syscall

      lw $a0, vector + 16($0)
      addi $s3, $a0, 0
      syscall

      lw $a0, vector + 24($0)
      addi $s4, $a0, 0
      syscall

      #addi $a0, $s0, 1
      #syscall    # Muestra el segundo número en pantalla
loop: 
      
      bge $s0,2,L3 # if(#s0 >=2)#n IMPRESION EN TEORIA
      
      beq $s0,1,L2 # if ($s0 == 1)#SEGUNDA IMPRESION EN TEORIA
      
      beq $s0,0,L1 # if ($s0 == 0)#PRIMERA IMPRESION EN TEORIA
      
      L1:   addi $s2, $s2, 1 #Operaciones L1
            addi $a0, $s2, 0
            syscall
            j L4 #Saltamos hasta las instrucciones de la etiqueta L4

      L2:   addi $s3, $s3, 1 #Operaciones L2
            addi $a0, $s3, 0
            syscall
            j L4 #Saltamos hasta las instrucciones de la etiqueta L4      

      L3:   add $s4, $s3, $s2 #Operaciones L3
            addi $a0, $s4, 0
            syscall
            add $s2, $s3, 0
            add $s3, $s4, 0
            addi $a0, $s2, 0
	    addi $a0, $s3, 0
            j L4 #Saltamos hasta las instrucciones de la etiqueta L4

      L4: addi $s0, $s0, 1 #s0 = s0 + 1 (Iterator), INSTRUCCIONES L4
          addi $a0, $s0, 0 #guardar en $a0 los cambios al iterador

      ble $s0, $s1, loop
      #syscall

      li $v0, 10 # Finalizarprograma
      syscall