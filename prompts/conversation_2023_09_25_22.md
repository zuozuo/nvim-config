write me a python function that recurrsively calls to_json method on the object

------------------------------

Here's a Python function that recursively calls the `to_json` method on an object:

```python
def to_json_recursive(obj):
    if hasattr(obj, 'to_json'):
        return obj.to_json()
    elif isinstance(obj, dict):
        return {k: to_json_recursive(v) for k, v in obj.items()}
    elif isinstance(obj, list):
        return [to_json_recursive(item) for item in obj]
    else:
        return obj
```

This function checks if the object has a `to_json` method. If it does, it calls that method and returns the result. If the object is a dictionary, it recursively calls `to_json_recursive` on each value in the dictionary. If the object is a list, it recursively calls `to_json_recursive` on each item in the list. If none of these conditions are met, it simply returns the object as is.

You can use this function to recursively convert an object to JSON by calling `to_json_recursive(obj)`.

====================================================================================================


