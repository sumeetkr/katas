import static org.junit.Assert.*;
import katas.SequenceAlignmentEvaluator;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;


public class SequenceAlignmentEvaluatorTest {

	private SequenceAlignmentEvaluator evaluator;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		this.evaluator = new SequenceAlignmentEvaluator();
	}

	@Test
	public void testCalculatePenaltyWithNoDifference() {
		String first = "ABCDEFG";
		String second = "ABCDEFG";
		
		assertTrue(this.evaluator.calculatePenaltyBasedOnDiffernceOfAlignment(first, second) == 0);
	}
	
	@Test
	public void testCalculatePenaltyWithOneLesserCharacter() {
		String first = "ABCDEFG";
		String second = "ABCDEF";
		
		assertTrue(this.evaluator.calculatePenaltyBasedOnDiffernceOfAlignment(first, second) == 1);
	}
	
	@Test
	public void testCalculatePenaltyWithOneUnmatchedCharacter() {
		String first = "ABCDEFG";
		String second = "ABCDEFH";
		
		assertTrue(this.evaluator.calculatePenaltyBasedOnDiffernceOfAlignment(first, second) == 2);
	}
	
	

}
