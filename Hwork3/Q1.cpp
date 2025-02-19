#include <iostream>
#include <stack>
#include <vector>
#include <algorithm>
#include <sstream>

using namespace std;

// Partition function starts with first in array as pivot
int partition(vector<int>& array, int low, int high) {
    int pivot = array[low]; // Choose pivot
    int i = low + 1;
    
//checking for difrence between elements and swaping elements as needed
    for (int k = low + 1; k <= high; k++) {
        if (array[k] < pivot) {
            swap(array[i], array[k]);
            i++;
        }
    }
    swap(array[low], array[i - 1]); // returning pivot back to the correct position
    return i - 1; // returning pivit index
}

//Itteriative Qucik sort
void quickSort(vector<int>& array) {
    stack<pair<int, int>> stack;
    stack.push({0, array.size() - 1});
    
    while (!stack.empty()) {
        int lower = stack.top().first;
        int higher = stack.top().second;
        stack.pop();
        
        if (lower < higher) {
            int pivot = partition(array, lower, higher);
            
            // Push left and right of pivot
            stack.push({pivot + 1, higher});
            stack.push({lower, pivot - 1});
            
        }
    }
}

// Print function for displaying array
void printArray(const vector<int>& array) {
    for (int number : array) {
        cout << number << " ";
    }
    cout << endl;
}

int main() {
    vector<int> array;
    string numbers;
    int num;
    
//Retreiving list of numbers from user. requires space delimitors
    cout << "Enter the numbers separated by spaces: ";
    getline(cin, numbers);
    
//converts str to int array
    stringstream ss(numbers);
    while (ss >> num) {
        array.push_back(num);
    }
    
//printing user given list of numbers
    cout << "Original: ";
    printArray(array);
    
    quickSort(array);
    
//printing sorted list of numbers
    cout << "Sorted: "; 
    printArray(array);
    
    return 0;
}
