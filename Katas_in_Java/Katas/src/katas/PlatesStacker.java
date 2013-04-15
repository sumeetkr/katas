package katas;

import java.util.ArrayList;
import java.util.List;


public class PlatesStacker {

	public List<Plate> findHeighestStack(List<Plate> plates) {
		List<Plate> stackedPlates = new ArrayList<Plate>();
		//i, j, create a stack P[i] for each index,find max of P[i]
		List<ArrayList<Plate>> platesStacks = new ArrayList<ArrayList<Plate>>();
		for(int index =0; index< platesStacks.size(); index ++ ){
			//stackPlates(platesStacks, index);
		}
		
		//check for maximum
		
		return stackedPlates;
	}
	private void stackPlates(List<ArrayList<Plate>> platesStack, List<Plate> plates, int i){
		
		for(int j =0; j<i; j++){
			ArrayList<Plate> platesAtJthPositions = platesStack.get(j);
			Plate lastPlate = platesAtJthPositions.get(platesAtJthPositions.size() -1);
			if(lastPlate.isSmaller(plates.get(i))){
				
			}
		}
	}

	public class Plate {
		private int width;
		private int height;

		public Plate(int width, int height) {
			this.width = width;
			this.height = height;
		}

		public int getHeight() {
			return this.height;
		}

		public int getWidth() {
			return this.width;
		}

		public boolean isSmaller(Plate otherPlate) {
			return ((this.width > otherPlate.width
					&& this.height > otherPlate.height )|| (this.height > otherPlate.width
					&& this.width > otherPlate.height));
		}
	}
}
