class Solution {
    public int mySqrt(int x) {
        if (x < 2) return x;  // sqrt(0)=0, sqrt(1)=1

        int left = 1, right = x / 2, ans = 0;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            
            if ((long) mid * mid == x) {  // exact square
                return mid;
            } else if ((long) mid * mid < x) {
                ans = mid;   // store the floor value
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return ans;
    }
}
