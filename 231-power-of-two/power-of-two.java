class Solution {
    public boolean isPowerOfTwo(int n) {
        if (n <= 0) return false;   // negative numbers & 0 are not powers of two
        return (n & (n - 1)) == 0;
    }
}
