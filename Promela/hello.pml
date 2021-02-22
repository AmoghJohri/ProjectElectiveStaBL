/* The init command is used to declare the behavior of the process that is active in the initial state of the system. We can have a program with at most 1 (i.e., {0,1}) init commands. It does not take any arguments, and cannot have any additional copies of it either. Wherever this is declared, it gets activated instantly as well (for other processes declaration and activation are separate phenomenon). Hence, it cannot be passed to the run operator as well. Here, it does something very simple, that is it prints 'Hello World!\n'. This program, as a whole, creates one process (the init process) which prints 'Hello World!' */

init{
    printf("Hello World!\n");
}