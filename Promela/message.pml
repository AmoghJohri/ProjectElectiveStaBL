/*Finally we look at message passing channels (and goto statements, but they are identical to how they are anywhere else. We just define a label for a statement, and then goto sends the control flow to that statement.)
Message passing through channels and shared variables are two ways of inter-process communication in Promela. We have looked at shared variables, here we look at message passing.

First we define an mtype with 4  symbolic values.
Next we define 2 channels, to_sndr and to_rcvr. Channels by default store messages in first-in first-out order. If a channel capacity is 0 (that is, it is not initialized as an array) then it is used for synchornous communication only. Otherwise, the channel is buffered and can be used for asynchronous communication as well.
Here we define two channels and two processes. Each channel is unidirectional, w.r.t one process, i.e.,
Receiver can only listen to 'to_rcvr' channel and Sender can only listen to  'to_sndr' channel, however, it need not have been the case.

The syntax is as follos:
    channel_name ! message_to_be_sent;
    channel_name ? message_to_be_received;

Every receive statement can be considered as a blocking statement, i.e., if we have 
    channel_name ? message_to_be_received
and the appropriate message is not received, then the control flow shall be stuck there forever. 
*/

mtype = { msg0, msg1, ack0, ack1 };

chan    to_sndr = [2] of { mtype };
chan    to_rcvr = [2] of { mtype };

active proctype Sender()
{
    again:  to_rcvr!msg1; printf("msg1 sent from sender to receiver\n");
            to_sndr?ack1; printf("ack1 received from receiver\n");
            to_rcvr!msg0; printf("msg0 sent from sender to receiver\n");
            to_sndr?ack0; printf("ack0 received from receiver\n"); goto out;
            goto again
    out: printf("Sender Fin.!\n");
}

active proctype Receiver()
{
    again:  to_rcvr?msg1; printf("msg1 received from sender\n");
            to_sndr!ack1; printf("ack1 sent from receiver to sender\n");
            to_rcvr?msg0; printf("msg0 received from sender\n");
            to_sndr!ack0; printf("ack0 sent from receiver to sender\n"); goto out;
            goto again
    out: printf("Receiver Fin.!\n");
}