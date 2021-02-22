/* Below are two processes which share a global variable. Now, since we use atomic{}, the statements of process A do not get interleaved with that of process B (i.e., both the print statements of process A shall be right next to one another in execution) */

int x = 5;

proctype A(){
    atomic{
    x = x*2;
    printf("I am in the first print statement of process A, and the value of x is: %d\n", x);
    x = x*3;
    printf("I am in the second print statement of process A, and the value of x is: %d\n", x);}
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