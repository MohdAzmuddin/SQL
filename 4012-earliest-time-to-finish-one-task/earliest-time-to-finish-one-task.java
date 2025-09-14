class Solution {
    public int earliestTime(int[][] tasks) {
        int less = Integer.MAX_VALUE;
        for (int[] t : tasks) {
            int finish = t[0] + t[1];
            less = Math.min(less, finish);
        }
        return less;
    }
}