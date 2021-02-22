/*In promela, a condition can be used as a statement. If the condition is true, we skip to the next statement, otherwise we wait there forever (or until the timeout). This is similar to what we saw with if..fi, and this phenomenon will carry over to the do..od construct (construct for looping.)
*/
init{
    int a = 4;
    a == 3;
    printf("I will never get executed since the statement above me never evaluates to true\n");
}