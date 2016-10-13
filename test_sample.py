# content of test_sample.py
def func(x):
    return x + 1

def test_answer():
    assert func(0) == 1
	
def test_answer2():
    assert func(1) == 2
	
def test_answer3():
    assert func(2) == 3
	
def test_answer4():
    assert func(3) == 4
	
def test_answer5():
    assert func(4) == 5