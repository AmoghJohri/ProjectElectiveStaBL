/* Dealing with variables is somewhat similar to how we do it for C. We need to declare a variable along with its type, and then we can combine it basic arithmetic operators. One thing to note here is that, promela's printf statement does not allow any side-effects (i.e., if I do something like printf(z++), then it shall throw an error. Hence, everything which has side-effects (like z++ which increments the value of z and in turn leads to a change in state), needs to be evaluated outside the printf statement. On the other hand, expressions like printf(x + y), which do not have any side-effects can be performed the way they are in C.*/

init {
    int x = 4;
    int y = 3;
    int z;
    z = (x + y)*x;
    printf("Value of x: %d\n", x);
    printf("Value of y: %d\n", y);
    printf("Value of z: %d\n", z);
    z++;
    printf("Value of z++: %d\n", z);
    printf("Value of x + y: %d\n", x + y);
}