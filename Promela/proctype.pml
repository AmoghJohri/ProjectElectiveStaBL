/*Like init process, we can also have other processes, but these are different from init in a couple of of ways.
    1. It needs to be explicitly instantiated (this can be done by either putting it in the run operator, or by prefixing the definition with 'active' keyword. In this example, we are going with the latter)
    2. We can pass arguments to such processes, and since we are not passing any arguments for this the process-name is suffixed by empty paranthesis
    
We can also see an example of using variables having scope local to the process.

Moreover, every process gets a unique process-id (denoted by _pid), which is a whole number. Processes are assigned ID's in a sequential manner w.r.t their instantiation (that is, here, process_A shall always be assigned _pid = 0, and process_B shall always be assigned _pid = 1.) However, this does not mean that process_A shall always get executed before process_B, the selection of which statement of which process needs to be executed next is determined non-deterministically. Hence, in the following scenario (since both processes have 2 statements), all 4 possibilities are possible:
    1. Process_A.statement_1 -> Process_A.statement_2 -> Process_B.statement_1 -> Process_B.statement_2
    2. Process_A.statement_1 -> Process_A.statement_2 -> Process_B.statement_2 -> Process_B.statement_1
    3. Process_A.statement_2 -> Process_A.statement_1 -> Process_B.statement_1 -> Process_B.statement_2
    4. Process_A.statement_2 -> Process_A.statement_1 -> Process_B.statement_2 -> Process_B.statement_1

Furthermore, process_C has been defined, but not prefixed with the active keyword (or instantiated with a run operator anywhere), and hence, that process never gets instantiated*/


active proctype process_A(){
    int x = 6;
    printf("I am process A, and the value of x is: %d\n", x);
    printf("I am process A, and my process-id is: %d\n", _pid);
}

active proctype process_B(){
    int x = 9;
    printf("I am process B, and the value of x is: %d\n", x);
    printf("I am process B, and my process-id is: %d\n", _pid);
}

proctype process_C(){
    int x = 12;
    printf("I am process C, and I won't do anything since I was never instantiated :(\n");
}