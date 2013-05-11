package katas;

public class BitManipulation {

	public static int swapBits(int a) {
		boolean [] bits = new boolean[7];
		
		for(int i = 6; i >= 0; i--){
			bits[i] = ((a & (1 << i)) != 0);
		}

		for(int i = 6; i >= 1; i = i -2){
			boolean temp = bits[i];
			bits[i] = bits[i-1];
			bits[i-1] = temp;
		}
		
		return 0;
	}

}
