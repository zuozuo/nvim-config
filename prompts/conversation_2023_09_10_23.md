write a selection sort with C++


------------------------------

Here is an example of a selection sort algorithm implemented in C++:

```cpp
#include <iostream>

void selectionSort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        int minIndex = i;
        for (int j = i + 1; j < n; j++) {
            if (arr[j] < arr[minIndex]) {
                minIndex = j;
            }
        }
        std::swap(arr[i], arr[minIndex]);
    }
}

int main() {
    int arr[] = {64, 25, 12, 22, 11};
    int n = sizeof(arr) / sizeof(arr[0]);

    selectionSort(arr, n);

    std::cout << "Sorted array: \n";
    for (int i = 0; i < n; i++) {
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;

    return 0;
}
```

In this example, the `selectionSort` function takes an array `arr` and its size `n` as parameters. It iterates through the array and finds the minimum element in the unsorted portion of the array. It then swaps this minimum element with the first element of the unsorted portion. This process is repeated until the entire array is sorted.

The `main` function initializes an array `arr` with some values and calculates its size. It then calls the `selectionSort` function to sort the array. Finally, it prints the sorted array to the console.

====================================================================================================


