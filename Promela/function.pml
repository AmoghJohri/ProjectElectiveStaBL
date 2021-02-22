/* There is no provision for declaration of functions in Promela. As a work around, we can use macros for declaring functions. 
One might think functions can be declared as separate processes and then we can use the run operator to launch them whenever required, but that would indeed be a bad idea, as the intrinsic nature of processes and functions are very different (even though they might just 'appear' to be similar in terms of syntax, etc. Out of a number of problems with that method, one major issue is multiple processes are run asynchronously by spin, which is not an attribute of function. */

#define sum(a,b) (a + b)
active proctype P(){
    int x = 2;
    int y = 3;
    printf("Value of x + y: %d\n", sum(x,y));
}