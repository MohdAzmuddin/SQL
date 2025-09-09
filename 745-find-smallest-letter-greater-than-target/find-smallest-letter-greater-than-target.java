class Solution {
    public char nextGreatestLetter(char[] letters, char target) {
        char ans = '$';
        int low = 0, high = letters.length-1;
        while(low<=high){
            int mid  = low  + (high-low)/2;
             if(letters[mid]<=target){
                low  = mid+1;
            }
            else{
                high = mid-1;
                ans = letters[mid];
            }
        }
        return (ans=='$')?letters[0]:ans;
    }
}