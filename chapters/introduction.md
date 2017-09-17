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
* [Why Python for Deep Learning?](why-python-for-deep-learning)

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
>>> X = [[0, 0], [0, 1], [1, 0], [1, 1]]
>>> y = [[0], [1], [1], [0]]
>>> from keras.models import Sequential
>>> from keras.layers import Dense, Activation
>>> model = Sequential([
    Dense(8, input_dim = 2),
    Activation('tanh'),
    Dense(1),
    Activation('sigmoid')
])
>>> model.compile(optimizer = 'sgd', loss = 'binary_crossentropy')
>>> model.fit(X, y, batch_size = 1, epochs = 1000)

>>> import numpy as np
>>> np.round(model.predict(X))
array([[ 0.],
       [ 1.],
       [ 1.],
       [ 0.]], dtype=float32)
```
