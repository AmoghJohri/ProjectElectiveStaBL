/*Below we define an example of defining, instantiating and using an array.*/

init{
    int a[5];
    a[0] = 3;
    a[1] = 5;
    a[2] = 2;
    a[3] = 1;
    a[4] = 4;

    int i  = 4;
    int m  = 100;

    atomic{
        do
        :: i == -1 -> break;
        :: else -> 
            if
            :: a[i] < m -> m = a[i]; i--;
            :: a[i] >= m -> i--;
            fi 
        od
    }
    
    printf("Min value of the array is: %d\n", m);
}