class Solution {
    public int peakIndexInMountainArray(int[] arr) {
        int n = arr.length;
        int low = 0;
        int high = n-1;
        while(low<=high){
            int mid = low + (high-low)/2;
            if(mid!=0 && mid!=n-1 && arr[mid]>arr[mid-1] && arr[mid]>arr[mid+1]){
                return mid;
            }
            else if (mid!=n-1 && arr[mid]<arr[mid+1]){
                low = mid+1;//incrrasing
            }
            else{
                high = mid-1;
            }
        }
        return -1;
    }
}