/* Here we see an example of parameter passing and instantiating a process using the run operator. Also one thing to note here is that since we are init is instantiated before process_C, _pid of init is 0, and that of process_C is 1 (even though it is defined before.) */

proctype process_C(int x){
    printf("I am process C, and this time I get instantiated :)\n");
    printf("The value of x that has been passed is: %d\n", x);
}

init{
    run process_C(2);
}