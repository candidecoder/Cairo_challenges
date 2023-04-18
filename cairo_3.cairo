#cairo challenge 3

func add1(y : felt) -> (z : felt) {
    return (z=y + 1);
}   

func add1_square(x: felt) -> (x: felt) {
    // Call `add1` and unpack the result into `z`.
    let (z) = add1(y=x);
    return (x=z * z);
}

func main() {
    // Call `add1_square` and save the result into `res`.
    let (res) = add1_square(x=12);
    tempvar temp = res; 

    // Verify the computation.
    assert temp = (12 + 1) * (12 + 1);
    return ();
}
