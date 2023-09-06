











write a function with python
this function convert a dictionary to a string recursively
concated from key=value pairs of the dictionary separated by |
for example:
input: {"a": 1, "b": 2, "c": 3} 
output: "a=1|b=2|c=3"

for example:
input: {"a": 1, "b": 2, "c": {"d": 44, "e": 55}} 
output: "a=1|b=2|c.d=44|c.e=55"

the response should be in markdown format

------------------------------

```python
def dict_to_string(dictionary):
    result = ""
    for key, value in dictionary.items():
        if isinstance(value, dict):
            sub_dict_string = dict_to_string(value)
            sub_dict_items = sub_dict_string.split("|")
            sub_dict_items = [f"{key}.{item}" for item in sub_dict_items]
            result += "|".join(sub_dict_items) + "|"
        else:
            result += f"{key}={value}|"
    return result[:-1]
```

The `dict_to_string` function takes a dictionary as input and converts it to a string recursively. It iterates over the key-value pairs of the dictionary and checks if the value is itself a dictionary. If it is, the function recursively calls itself to convert the sub-dictionary to a string. The sub-dictionary string is then split into individual key-value pairs and each key is prefixed with the parent key using dot notation. Finally, all the key-value pairs are concatenated with "|" as the separator and returned as the output string.

Example usage:
```python
dictionary = {"a": 1, "b": 2, "c": {"d": 44, "e": 55}}
output = dict_to_string(dictionary)
print(output)  # Output: "a=1|b=2|c.d=44|c.e=55"
```

====================================================================================================


