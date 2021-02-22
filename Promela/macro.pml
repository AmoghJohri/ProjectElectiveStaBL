/* macros in Promela work identical to macros in C*/

#define N 10
active proctype P(){
    #define A 10
    printf("Value of N: %d\n", N);
    printf("Value of A: %d\n", A);
    printf("Value of N + A: %d\n", N + A);
}