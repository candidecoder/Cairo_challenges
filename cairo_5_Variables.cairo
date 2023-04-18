%builtins output

// Import the serialize_word() function.
from starkware.cairo.common.serialize import serialize_word

// Outputs the value 2^9.
func main{output_ptr: felt*}() {
    alloc_locals;
    local x = 2;
    local y = x * x * x;
    local z = y * y * y;
    // Because of the `let`s, the following line is equivalent to
    // serialize_word(x * x * x * x * x * x * x * x * x).
    serialize_word(z);
    return ();
}
