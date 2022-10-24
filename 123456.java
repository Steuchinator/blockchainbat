public boolean has23(int[] nums) {
  for(int i : nums){
    if (i==3||i==2)
      return true;
  }
  return false;
}
