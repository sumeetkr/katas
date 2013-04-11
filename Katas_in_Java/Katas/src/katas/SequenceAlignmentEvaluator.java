package katas;

public class SequenceAlignmentEvaluator {

	public int calculatePenaltyBasedOnDiffernceOfAlignment(String firststring,
			String secondString) {
		int penalty = 0;
		char[] baseSequence;
		char[] otherSequence;

		if (firststring.length() >= secondString.length()) {
			baseSequence = firststring.toCharArray();
			otherSequence = secondString.toCharArray();
		} else {

			baseSequence = secondString.toCharArray();
			otherSequence = firststring.toCharArray();
		}

		return penaltyCalculator(baseSequence, otherSequence,
				baseSequence.length - 1, otherSequence.length - 1);
	}

	private  int penaltyCalculator(char[] firstSeq, char[] secondSeq, int firstIndex, int secondIndex){
		int penalty = 0;
		
		while(firstIndex > 0 && secondIndex > 0){
			//three possilities, char and char, char and empty, empty and char
			int charAndChar = penaltyOnDifference(firstSeq[firstIndex], secondSeq[secondIndex]);
			int charAndEmpty = penaltyOnDifference(firstSeq[firstIndex], '\0');
			int emptyAndChar = penaltyOnDifference('\0', secondSeq[secondIndex]);
			
			
//			penalty += Math.min(penaltyCalculator(firstSeq, secondSeq, firstIndex, secondIndex),
//					penaltyOnDifference(firstSeq, '\0');
		}
		return penalty;
	}
	
	private int penaltyOnDifference(char first, char second){
		int penalty = 0;
		if(first != second){
			penalty = 1;
		}
		
		return penalty;
	}
}
