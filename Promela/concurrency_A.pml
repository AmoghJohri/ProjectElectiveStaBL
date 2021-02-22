/* Below are two processes which share a global variable. Since the sequnce of execution is decided non-deterministically, we cannot can have interleaving between the statements of the processes A and B*/
int x = 5;

proctype A(){
    x = x*2;
    printf("I am in the first print statement of process A, and the value of x is: %d\n", x);
    x = x*3;
    printf("I am in the second print statement of process A, and the value of x is: %d\n", x);
}

proctype B(){
    x = x+2;
    printf("I am in the first print statement of process B, and the value of x is: %d\n", x);
    x = x+3;
    printf("I am in the second print statement of process B, and the value of x is: %d\n", x);
}

init{
    run A();
    run B();
}