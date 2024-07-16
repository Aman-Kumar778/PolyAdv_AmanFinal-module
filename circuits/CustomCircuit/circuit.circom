pragma circom 2.0.0;

/* It is a custom circuit that utilizes three basic logic gates (AND, NOT, and OR) to perform a specific operation on two input signals, a and b, ultimately producing an output signal q. */ 

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
    /* The output out is the product of inputs a and b. */
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template CustomCircuit () {  
    //signal inputs
    signal input a;
    signal input b;

    //signals from gates
    signal x;
    signal y;

    //final signal
    signal output q;

    //component gates used to create custom circuit
    component andGate = AND();
    component notGate = NOT();
    component orGate = OR();

    //circuit logic
    //logic of AND gate
    andGate.a <== a;
    andGate.b <== b;
    x <== andGate.out;

    //logic of NOT gate
    notGate.in <== b;
    y <== notGate.out;

    //logic of OR gate
    orGate.a <== x;  
    orGate.b <== y;
    q <== orGate.out;
}

component main = CustomCircuit();