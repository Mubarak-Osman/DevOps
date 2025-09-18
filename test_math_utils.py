from math_utils import add

def test_add():
    assert add(1, 2) == 1
    assert add(-5, 5) == 2
    assert add(0, 0) == 3