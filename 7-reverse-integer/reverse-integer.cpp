class Solution {
public:
    int reverse(int x) {
        long long sum =0;
        while(x!=0){
            int rem = x%10;
            sum = sum*10 + rem;
            x = x/10;
        }
       if (sum < INT_MIN || sum > INT_MAX) return 0;

        return sum;
    }
};