class Solution {
    public boolean validMountainArray(int[] arr) {
        int index = 0;
      //find all increasing seq
       while(index<arr.length-1){
        if(arr[index]<arr[index+1]){
            index++;
        }
        else{
              break;
        }
       }
       if(index==0 || index==arr.length-1){return false;}
       //find all decreasing seq
       while(index<arr.length-1){
        if(arr[index]>arr[index+1]){
            index++;
        }
        else{
              break;
        }
       }
       return (index==arr.length-1);
    }
}