/* Now we discuss how if-conditions can be worked with in Promela. Below is a very simple example, which checks whether the integer a was even or odd. 
The basic syntax, is as follow:

if 
:: condition1 -> statement1;
:: condition2 -> statement2;
            .
            .
            .
:: conditionN -> statementN;
fi 

Though it might appear similar to conditionals that we see in C or Java, there are a few critical differences here
    1. the evaluation of conditionals happen in a random order i.e., suppose we had a similar construct in Java, then we could have written it as:
        if(condition1)
            statement1;
        else if(condition2)
            statement2;
        else
            statement3;
    In this case, first the if condition would be evaluated, if that was false then the else if would have been evaluated, and if that was false as well, finally the statement corresponding to else would be executed.
    In Promela however, if conditionI gets evaluated before conditionJ, this does not mean that I < J. i.e., if we had
    if 
    :: condition1 -> statement1;
    :: condition2 -> statement2;
    fi 
    Then condition1 could get evaluated before condition2 OR condition2 can get evaluated before condition1. The decision of which gets evaluated before the other is taken non-deterministically. 

    Finally, as another example, suppose we have the python condition
    
    if condition1:
        statement1
    elif condition2:
        statement2 

    then a Promela equivalent for that would be:

    if 
    :: condition1 & ~(condition2) -> statement1;
    :: condition2 & ~(condition1) -> statement2;
    fi 

    We can also explicitly specify else, which would get executed when all the conditions are false.
    if 
    :: condition1 -> statement1;
    :: condition2 -> statement2;
    :: else       -> statement3; 
    fi 
    In the above example, statement3 gets executed when !condition1 & !condition2 == true.

    2. Another major difference is, there is no concept of else or dropping off in Promela. Suppose we go back to the python example that we just descibed, if we do not have an else statement, and suppose none of the condition corresponding to if or elif is satisfied, then python will just move on to the next statements in the program. However, if none of the statements in a Promela if..fi construct gets evaluated to true, it will keep waiting until it gets evaluated to true (even if it means waiting forever).
*/
init{
    int a = 4;
    if
    :: a % 2 == 0 -> printf("a was even!\n");
    :: a % 2 == 1 -> printf("a was odd!\n");
    fi
}