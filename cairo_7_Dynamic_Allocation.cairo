%builtins output

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word

// Fills `new_array` with the squares of the first `length` elements in `array`.
func _inner_sqr_array(array: felt*, new_array: felt*, length: felt) {
    if (length == 0) {
        return ();
    }

    assert [new_array] = [array] * [array];

    _inner_sqr_array(array=array + 1, new_array=new_array + 1, length=length - 1);
    return ();
}

func sqr_array(array: felt*, length: felt) -> (new_array: felt*) {
    alloc_locals;
    let (local new_array) = alloc();
    _inner_sqr_array(array=array,new_array=new_array,length=4);
    return(new_array=new_array);
}

func main{output_ptr: felt*}() {
    alloc_locals;
    // Allocate a new array.
    let (local array) = alloc();
    // Fill the new array with field elements.
    assert [array] = 1;
    assert [array + 1] = 2;
    assert [array + 2] = 3;
    assert [array + 3] = 4;

    let (new_array) = sqr_array(array=array, length=4);
    serialize_word([new_array]);
    serialize_word([new_array + 1]);
    serialize_word([new_array + 2]);
    serialize_word([new_array + 3]);


    return ();
}

