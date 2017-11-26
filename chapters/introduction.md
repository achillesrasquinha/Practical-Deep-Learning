<!-- Header -->
<div align="center">
    <img src="../.github/logo-dl.png" height="256"/>
    <h1>Practical Deep Learning</h1>
    <h5>
        Introduction to Deep Learning
    </h5>
</div>
<!-- end Header -->

<!-- shields -->
<div align="center">
    <img
    src="https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg">
    <img src="https://img.shields.io/badge/donate-%24-f44336.svg">
</div>
<!-- end shields -->

### Table of Contents
* [5 Ws and H (What, Why, When, Where, Who, How) of Deep Learning]()
* [Why Python for Deep Learning?](why-python-for-deep-learning)

#### 5 Ws and H (What, Why, When, Where, Who, How) of Deep Learning
##### What
<p align="justify">
    In order to understand what Deep Learning is all about, let's first come to understand the term - <b>learning</b> itself. I find Tom Mitchell's articulate definition in his book - [Machine Learning]
</p>

#### Why Python for Deep Learning?
<div align="center">
    <img src="https://imgs.xkcd.com/comics/python.png"/>
    <div align="right">
        Source: <a href="https://xkcd.com/353">xkcd.com/353</a>
    </div>
</div>

##### High-Abstraction
<p align="justify">
    Take <a href="https://keras.io">keras</a> for instance (A high-level Python library built on top of <a href="https://www.tensorflow.org">TensorFlow</a> and more). Here's a bare-minimum Multi-Layer Perceptron (a Deep Learning model) that attempts to learn an XOR gate.
</p>

```python
>>> X = [[0, 0], [0, 1], [1, 0], [1, 1]]                            # Our knowledge/experience
>>> y = [[0], [1], [1], [0]]                                        # Our target prediction
>>> from keras.models import Sequential                             # keras's "Sequential" model (a sequence of layers)
>>> from keras.layers import Dense, Activation                      # Types of layers provided by keras
>>> model = Sequential([                                            # Modelling
    Dense(8, input_dim = 2),                                        # Hidden-Layer with 8 neurons and incoming 2 inputs
    Activation('tanh'),                                             # Squashing our output with a Hyperbolic Tan function
    Dense(1),                                                       # Output-Layer with 1 neuron
    Activation('sigmoid')                                           # Squashing our output with a Sigmoid function
])
>>> model.compile(optimizer = 'sgd', loss = 'binary_crossentropy')  # Compiling our network to minimize our Cross Entropy Loss function with a Gradient Descent Optimizer
>>> model.fit(X, y, batch_size = 1, epochs = 1000)                  # Training Phase

>>> import numpy as np
>>> np.round(model.predict(X))                                      # Prediction
array([[ 0.],
       [ 1.],
       [ 1.],
       [ 0.]], dtype=float32)
```

<p align="justify">
    Pretty much every Deep Learning pipeline will have the above phases (gather data, preprocess if required, build a model, train and test). What is interesting is that Python (in this case, keras) creates for you the network and the math revolving around it, performs memory management, CPU and GPU utilization and a lot more <b>in 10 lines or less!</b> Much more complex deep learning architectures can be built too in maybe <b><a href="https://github.com/fchollet/keras/blob/master/keras/applications/vgg16.py">100 lines or less</a></b>.
</p>

##### Slow, yet Fast
Python is slow, yet fast. Okay, let me explain.

Here's a Python implementation of generating the [Fibonacci Series](https://en.wikipedia.org/wiki/Fibonacci_number):

```python
def fibonacci(n):
    a, b = 0, 1

    for _ in range(1, n):
        a, b = b, a + b
    
    return b
```
```python
%timeit fibonacci(10)
```
```console
797 ns ± 19.6 ns per loop (mean ± std. dev. of 7 runs, 1000000 loops each)
```

Here's an equivalent [Cython](http://cython.org) version of the same:

```python
%load_ext Cython
```
```python
%%cython
def fibonacci(n):
    cdef int _
    cdef int a = 0, b = 1

    for _ in range(1, n):
        a, b = b, a + b
    
    return b
```
```python
%timeit fibonacci(10)
```
```console
57.7 ns ± 2.68 ns per loop (mean ± std. dev. of 7 runs, 10000000 loops each)
```

<p align="justify">
    The difference between the two implementations is about <b>739.3 nanoseconds</b>! Python in its raw form is terribly slow. But if the same is wrapped around low-level languages like C, Pythonic implementations tend to be then faster. This provides us the power of C with the goodness of Python.
</p>
