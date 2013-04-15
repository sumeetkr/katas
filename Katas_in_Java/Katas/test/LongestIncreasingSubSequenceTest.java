import static org.junit.Assert.*;
import katas.LongestIncreasingSubSequenceFinder;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;


public class LongestIncreasingSubSequenceTest {

	private LongestIncreasingSubSequenceFinder finder; 

	@Before
	public void setUp() throws Exception {
		this.finder = new LongestIncreasingSubSequenceFinder();
	}

	@Test
	public void testFind() {
		int[] inputSequence = {5,3,7,1,8,4,0};
		int lengthOfMaxSubSequence = this.finder.findLength(inputSequence);
		assertEquals(3, lengthOfMaxSubSequence);
	}

}
