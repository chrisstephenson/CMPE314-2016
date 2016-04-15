#include <stdio.h>
#include <stdlib.h>

int fib (int n, int a, int b){
  if (n <= 1)
     return a;
  else
     return fib (n-1, b, a+b);
}


int main(int argc, char** argv) {
  int n = 0;
  if (argc != 2) {
    printf("\nUsage is bruijn <number>\n To calculate nth fibonacci number\n");
  } else {
    n = atoi(argv[1]);
    printf("\n%dth Fibonacci number is %d\n", n, fib(n,1,1));
  }  
  return 1;
}
