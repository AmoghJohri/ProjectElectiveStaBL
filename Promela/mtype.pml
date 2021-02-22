/*mtype is used to denote symbolic values. Here, we show a rudimentary traffic light system where the light just switches from red -> green -> yellow

Three processes are defined and launched simultaneously, however, the first statement of each process only allows one process to be functionaing at any point of time. 
*/

mtype {red, green, yellow}; 
mtype light = red;

proctype red_to_green() {
    light == red;
    printf("In Process red_to_green\n");
    light = green;
}

proctype green_to_yellow() {
    light == green;
    printf("In Process green_to_yellow\n");
    light = yellow;
}

proctype yellow_to_red() {
    light == yellow;
    printf("In Process yellow_to_red\n");
    light = red;
}

init{
    run yellow_to_red();
    run green_to_yellow()
    run red_to_green();
}