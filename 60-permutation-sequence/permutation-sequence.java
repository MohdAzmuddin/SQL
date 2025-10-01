import java.util.*;

class Solution {
    public String getPermutation(int n, int k) {
        List<Integer> numbers = new ArrayList<>();
        int fact = 1;
        
        // initialize numbers list and factorial
        for (int i = 1; i <= n; i++) {
            numbers.add(i);
            fact *= i;
        }
        
        k--; // convert to 0-based index
        StringBuilder result = new StringBuilder();
        
        for (int i = n; i > 0; i--) {
            fact /= i; // (i-1)! 
            int index = k / fact;
            result.append(numbers.get(index));
            numbers.remove(index);
            k %= fact;
        }
        
        return result.toString();
    }
}
