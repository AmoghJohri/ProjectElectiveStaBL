/* Here is an example of a simple conditional statement. The syntax is only slightly different from C, where:
C has [cond ? expr1 : expr2]
Promela has  [cond -> expr1 : expr2]
So if the condition is true, we get expr1, and otherwise, to expr2
*/

active proctype P(){
    int a=1,b=3;
    int max = (a >= b -> a : b);
    printf("max: %d\n",max);
}