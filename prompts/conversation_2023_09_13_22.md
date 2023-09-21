write a python script:
* use websocket to create a websocket connection to the server
* this script act as a python websocket client

------------------------------

Sure! Here's an example of a Python script that uses the `websocket` library to create a WebSocket connection to a server:

```python
import websocket

def on_message(ws, message):
    print(f"Received message: {message}")
    

def on_error(ws, error):
    print(f"Error: {error}")

def on_close(ws):
    print("Connection closed")

def on_open(ws):
    print("Connection established")
    # Send a message to the server
    ws.send("Hello, server!")

if __name__ == "__main__":
    # WebSocket server URL
    url = "ws://localhost:8000/ws"

    # Create a WebSocket connection
    ws = websocket.WebSocketApp(url,
                                on_message=on_message,
                                on_error=on_error,
                                on_close=on_close)
    ws.on_open = on_open

    # Start the WebSocket connection
    ws.run_forever()
```

In this script, we define four callback functions: `on_message`, `on_error`, `on_close`, and `on_open`. These functions will be called by the `websocket` library when certain events occur during the WebSocket connection.

The `on_message` function is called whenever a message is received from the server. In this example, we simply print the received message.

The `on_error` function is called if an error occurs during the WebSocket connection. We print the error message in this example.

The `on_close` function is called when the WebSocket connection is closed. We print a message to indicate that the connection has been closed.

The `on_open` function is called when the WebSocket connection is established. In this example, we send a message to the server by calling the `send` method of the WebSocket connection object.

Finally, in the `if __name__ == "__main__":` block, we create a `WebSocketApp` object with the specified URL and the defined callback functions. We then start the WebSocket connection by calling the `run_forever` method.

You can replace the `url` variable with the actual WebSocket server URL you want to connect to.

====================================================================================================


