please explain and add comments to the following code:
```python
import neptune
from neptune.integrations.tensorflow_keras import NeptuneCallback

import tensorflow as tf
print("TensorFlow version:", tf.__version__)

from tensorflow.keras.layers import Dense, Flatten, Conv2D
from tensorflow.keras import Model

run = neptune.init_run()  # your credentials
mnist = tf.keras.datasets.mnist

(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0

# Add a channels dimension
x_train = x_train[..., tf.newaxis].astype("float32")
x_test = x_test[..., tf.newaxis].astype("float32")

train_ds = tf.data.Dataset.from_tensor_slices(
    (x_train, y_train)).shuffle(10000).batch(32)

test_ds = tf.data.Dataset.from_tensor_slices((x_test, y_test)).batch(32)


class MyModel(Model):
  def __init__(self):
    super().__init__()
    self.conv1 = Conv2D(32, 3, activation='relu')
    self.flatten = Flatten()
    self.d1 = Dense(128, activation='relu')
    self.d2 = Dense(10)

  def call(self, x):
    x = self.conv1(x)
    x = self.flatten(x)
    x = self.d1(x)
    return self.d2(x)

# Create an instance of the model
model = MyModel()

loss_object = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)
optimizer = tf.keras.optimizers.Adam()


train_loss = tf.keras.metrics.Mean(name='train_loss')
train_accuracy = tf.keras.metrics.SparseCategoricalAccuracy(name='train_accuracy')

test_loss = tf.keras.metrics.Mean(name='test_loss')
test_accuracy = tf.keras.metrics.SparseCategoricalAccuracy(name='test_accuracy')

@tf.function
def train_step(images, labels):
  with tf.GradientTape() as tape:
    # training=True is only needed if there are layers with different
    # behavior during training versus inference (e.g. Dropout).
    predictions = model(images, training=True)
    loss = loss_object(labels, predictions)
  gradients = tape.gradient(loss, model.trainable_variables)
  optimizer.apply_gradients(zip(gradients, model.trainable_variables))

  train_loss(loss)
  train_accuracy(labels, predictions)

@tf.function
def test_step(images, labels):
  # training=False is only needed if there are layers with different
  # behavior during training versus inference (e.g. Dropout).
  predictions = model(images, training=False)
  t_loss = loss_object(labels, predictions)

  test_loss(t_loss)
  test_accuracy(labels, predictions)

neptune_cbk = NeptuneCallback(run=run, base_namespace="training")

EPOCHS = 5

for epoch in range(EPOCHS):
  # Reset the metrics at the start of the next epoch
  train_loss.reset_state()
  train_accuracy.reset_state()
  test_loss.reset_state()
  test_accuracy.reset_state()

  for images, labels in train_ds:
    train_step(images, labels)

  for test_images, test_labels in test_ds:
    test_step(test_images, test_labels)

  print(
    f'Epoch {epoch + 1}, '
    f'Loss: {train_loss.result():0.2f}, '
    f'Accuracy: {train_accuracy.result() * 100:0.2f}, '
    f'Test Loss: {test_loss.result():0.2f}, '
    f'Test Accuracy: {test_accuracy.result() * 100:0.2f}'
  )

run.stop()
```

------------------------------

This code trains a convolutional neural network (CNN) model on the MNIST dataset using TensorFlow and logs the training progress to Neptune, a machine learning experiment tracking tool.

Here is a breakdown of the code:

1. Import necessary libraries:
```python
import neptune
from neptune.integrations.tensorflow_keras import NeptuneCallback

import tensorflow as tf
print("TensorFlow version:", tf.__version__)

from tensorflow.keras.layers import Dense, Flatten, Conv2D
from tensorflow.keras import Model
```
- `neptune` is a Python library for logging and visualizing machine learning experiments.
- `NeptuneCallback` is a callback class provided by Neptune for integrating TensorFlow Keras models with Neptune.
- `tensorflow` is the main library used for building and training neural networks.
- `Dense`, `Flatten`, and `Conv2D` are classes from `tensorflow.keras.layers` used to define the layers of the CNN model.
- `Model` is a class from `tensorflow.keras` used to define the structure of the model.

2. Initialize Neptune run:
```python
run = neptune.init_run()  # your credentials
```
- This line initializes a Neptune run, which allows logging of experiment metadata and metrics.

3. Load and preprocess the MNIST dataset:
```python
mnist = tf.keras.datasets.mnist

(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0

# Add a channels dimension
x_train = x_train[..., tf.newaxis].astype("float32")
x_test = x_test[..., tf.newaxis].astype("float32")
```
- The MNIST dataset is loaded using `tf.keras.datasets.mnist`.
- The pixel values of the images are normalized to the range [0, 1].
- An additional dimension is added to the images to represent the number of channels (in this case, 1 channel for grayscale images).

4. Create TensorFlow `Dataset` objects for training and testing:
```python
train_ds = tf.data.Dataset.from_tensor_slices(
    (x_train, y_train)).shuffle(10000).batch(32)

test_ds = tf.data.Dataset.from_tensor_slices((x_test, y_test)).batch(32)
```
- `tf.data.Dataset.from_tensor_slices` is used to create a dataset from the input data and labels.
- The training dataset is shuffled and batched with a batch size of 32.
- The testing dataset is batched with a batch size of 32.

5. Define the CNN model:
```python
class MyModel(Model):
  def __init__(self):
    super().__init__()
    self.conv1 = Conv2D(32, 3, activation='relu')
    self.flatten = Flatten()
    self.d1 = Dense(128, activation='relu')
    self.d2 = Dense(10)

  def call(self, x):
    x = self.conv1(x)
    x = self.flatten(x)
    x = self.d1(x)
    return self.d2(x)

# Create an instance of the model
model = MyModel()
```
- `MyModel` is a subclass of `Model` that defines the structure of the CNN model.
- The model consists of a convolutional layer, a flattening layer, and two dense layers.
- The `call` method defines the forward pass of the model.

6. Define loss function and optimizer:
```python
loss_object = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)
optimizer = tf.keras.optimizers.Adam()
```
- `SparseCategoricalCrossentropy` is used as the loss function, which is suitable for multi-class classification problems.
- `Adam` is used as the optimizer, which is a popular optimization algorithm for training neural networks.

7. Define metrics for tracking training and testing performance:
```python
train_loss = tf.keras.metrics.Mean(name='train_loss')
train_accuracy = tf.keras.metrics.SparseCategoricalAccuracy(name='train_accuracy')

test_loss = tf.keras.metrics.Mean(name='test_loss')
test_accuracy = tf.keras.metrics.SparseCategoricalAccuracy(name='test_accuracy')
```
- `Mean` is used to calculate the average loss over a batch of samples.
- `SparseCategoricalAccuracy` is used to calculate the accuracy of the model predictions.

8. Define training and testing steps:
```python
@tf.function
def train_step(images, labels):
  with tf.GradientTape() as tape:
    predictions = model(images, training=True)
    loss = loss_object(labels, predictions)
  gradients = tape.gradient(loss, model.trainable_variables)
  optimizer.apply_gradients(zip(gradients, model.trainable_variables))

  train_loss(loss)
  train_accuracy(labels, predictions)

@tf.function
def test_step(images, labels):
  predictions = model(images, training=False)
  t_loss = loss_object(labels, predictions)

  test_loss(t_loss)
  test_accuracy(labels, predictions)
```
- `@tf.function` is a decorator that converts the functions into TensorFlow graph functions for improved performance.
- `train_step` performs a forward pass, calculates the loss, computes gradients, and applies the gradients to update the model's trainable variables.
- `test_step` performs a forward pass and calculates the loss and accuracy for testing.

9. Initialize Neptune callback:
```python
neptune_cbk = NeptuneCallback(run=run, base_namespace="training")
```
- `NeptuneCallback` is instantiated with the Neptune run and a base namespace for logging.

10. Train the model:
```python
EPOCHS = 5

for epoch in range(EPOCHS):
  train_loss.reset_state()
  train_accuracy.reset_state()
  test_loss.reset_state()
  test_accuracy.reset_state()

  for images, labels in train_ds:
    train_step(images, labels)

  for test_images, test_labels in test_ds:
    test_step(test_images, test_labels)

  print(
    f'Epoch {epoch + 1}, '
    f'Loss: {train_loss.result():0.2f}, '
    f'Accuracy: {train_accuracy.result() * 100:0.2f}, '
    f'Test Loss: {test_loss.result():0.2f}, '
    f'Test Accuracy: {test_accuracy.result() * 100:0.2f}'
  )
```
- The model is trained for a specified number of epochs.
- At the start of each epoch, the metrics are reset.
- The training dataset is iterated over, and the `train_step` function is called for each batch.
- The testing dataset is iterated over, and the `test_step` function is called for each batch.
- The training and testing metrics are printed at the end of each epoch.

11. Stop the Neptune run:
```python
run.stop()
```
- This line stops the Neptune run and closes the experiment.

====================================================================================================


