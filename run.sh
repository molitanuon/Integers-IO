#/bin/bash
#Author name: Molita Nuon
#Program name: Demonstrate Numeric IO
#Assignment number: 1

rm *.o
rm *.out

echo "This is program <Demonstrate Numeric IO>"

echo "Assemble the module divison.asm"
nasm -f elf64 -l division.lis -o division.o division.asm

echo "Complie the C module integer_driver.c"
gcc -c -m64 -Wall -l integer_driver.lis -o integer_driver.o integer_driver.c -fno-pie -no-pie

echo "Link the two object file already created"
gcc -m64 -o fpio.out integer_driver.o division.o -fno-pie -no-pie

echo "The bash script file is now closing."
