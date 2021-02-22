/*Here we see how loops work in Promela. The syntax is:

    do 
    :: condition1 -> statement1;
    :: condition2 -> statement2;
            .
            .
            .
    :: conditionN -> statementN;
    od

The concepts are similar to if..fi. 
Note that we are having to explicitly put a break statment, because otherwise, the loop shall get executed forever.
*/
init{
    int n = 5;
    int factorial = 1;
    do
    :: n > 1 ->  factorial = factorial * n; n = n - 1;
    :: n == 1 -> printf("Value of n! is: %d\n", factorial); break;
    od
}