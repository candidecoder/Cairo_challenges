%builtins output

from starkware.cairo.common.serialize import serialize_word

// Returns a^3 for a != 0 and 1 otherwise.
func foo(a) -> (res: felt) {
    if (a == 0) {
        return (res=1);
    } else {
        return (res=a * a * a);
    }
}

// Outputs the value 10^3 + 5^3.
func main{output_ptr: felt*}() {
    alloc_locals;
    let (local x) = foo(10);
    //local x2 = x;
    let (local y) = foo(5);
    //local y2 = y;
    serialize_word(x + y);
    return ();
}
