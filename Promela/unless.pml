/* Unless is an exception handling construct in Promela. However, it behaves a little differently that the exception handling that we usually see. 
The syntax for unless block is as follows:
    unless{
        condition -> statement;
    }
Intuitively we might think that the control flow should go to the unless block if something goes wrong in the while loop. However, in Promela, whenver the condition corresponding to the unless block becomes true, the unless statement gets executed. Hence, in the example below, as soon as x becomes 1, the unless statement is executed. 
Also, the unless statements get evaluated in a out-to-in manner, that is in the example below, we have nested unless statements, such that both the unless statements become executable at the same condition. In this case, the control flow goes to the outer unless statement instead of the inner one.
Moreover, the unless statement gets executed as soon as it becomes valid, hence as we can see, there are three statements next to x%2==0
    1. printf("x became even!\n x is: %d\n", x); 
    2. x++; --- Here, the unless statement becomes executable, and hence, the control flow leaves here, and goes to the unless statement.
    3. printf("I won't get executed!\n");*/

init{
    int x = 0;
    {
        do
        :: x % 2 == 0 -> printf("x became even!\n x is: %d\n", x); x++; printf("I won't get executed!\n");
        od unless {
            x == 1 -> printf("Control Flow went to the inner unless statement!\n");
        } 
    } unless {
        x == 1 -> printf("Control Flow went to the outer unless statement!\n");
    } 
}
