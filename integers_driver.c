//Author name: Molita Nuon
//Program title: Demonstrate Numeric IO
//Files in this program: integer_driver.c, division.asm, run.sh
//Course number: CPSC 240
//Assignment number: 1
//Required delivery date: Feb 4, 2019 before 11:59pm
//Purpose: Learn how to embed C library function calls in an X86 module
//Language of this module: C
//Compile this module: gcc -c -m64 -Wall -l integer_driver.lis -o integer_driver.o integer_driver.c -fno-pie -no-pie
//Link object files: gcc -m64 -o fpio.out integer_driver.o division.o -fno-pie -no-pie
//Execute: ./fpio.out
#include <stdio.h>
#include <stdint.h>

extern long int division();
int main(){
  long int return_code = 0;

  printf("%s","Welcome to Integer Input/Output. \n");
  printf("%s", "This program was created by Molita Nuon and completed on Feb 4. \n");
  return_code = division();
  printf("%s%ld%s\n", "The driver has received this number: ",return_code,
            ". The driver will now return 0 to the operating system. Have a nice day.");
  return (0);
}
