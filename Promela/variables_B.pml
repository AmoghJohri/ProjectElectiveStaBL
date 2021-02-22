/* Variables (as well as message channels, that we shall come to later) can be declared outside the process as well. Now, they have a global scope, and they cannot be re-declared inside the process. However, if I had a separate statement outside the process (like int z; z = x + y;) then spin would throw an error.
The scope of the variable is global if it is declared outside all processes, and local if it is declared inside a process. New versions of spin also provide finer granularity in scoping rules, like scope being limited to an atomic block, etc.*/

int x = 4;
int y = 3;
int z = x + y;

init { 
    printf("Value of x: %d\n", x);
    printf("Value of y: %d\n", y);
    printf("Value of z: %d\n", z);
    z++;
    printf("Value of z++: %d\n", z);
    printf("Value of x + y: %d\n", x + y);
}