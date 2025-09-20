/**
 * // This is MountainArray's API interface.
 * // You should not implement it, or speculate about its implementation
 * interface MountainArray {
 *     public int get(int index) {}
 *     public int length() {}
 * }
 */
 
class Solution {
    public int findInMountainArray(int target, MountainArray mountainArr) {
        // peak index
        int n = mountainArr.length();
        int start = 0;
        int end = n-1;
        int mid  = -1;
        while(start<=end){
            mid = start + (end-start)/2;
            int curr = mountainArr.get(mid);
            if(mid!=0 && mid!=n-1 && curr>mountainArr.get(mid-1) && 
            curr>mountainArr.get(mid+1)){
                if(curr==target){
                    return mid;
                }
                break;
            }
            else if(mid!=n-1 && curr<mountainArr.get(mid+1)){
                start = mid+1;
            }
            else{
                end = mid-1;
           }
        }

        // find in first half (increasing)
        start =  0;
        end = mid-1;
        while(start<=end){
            int m = start +(end-start)/2;
            int curr = mountainArr.get(m);
            if(curr==target){return m;}
            else if(target<curr){end  = m-1;}
            else{start  =m+1;}
        }
        
        
        // find in second  half (decreasing)
        start = mid+1;
        end = n-1;
        while(start<=end){
            int m = start +(end-start)/2;
            int curr = mountainArr.get(m);
            if(curr==target){return m;}
            else if(target<curr){start = m+1;}
            else{ end  =m-1;}
        }
        return -1;
    }
}