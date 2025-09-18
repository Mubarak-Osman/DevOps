from math_utils import add

def test_add():
    assert add(1, 2) == 3
    assert add(-5, 5) == 0
    assert add(0, 0) == 0