/*Here is an example of how records are defined, instantiated and used in functions (macros to be precise)*/

# define area(r) (r.length * r.breadth)

typedef rectangle{
    int length;
    int breadth;
}

init{
    rectangle r;
    r.length = 3;
    r.breadth = 4;
    printf("Area: %d\n",area(r));
}