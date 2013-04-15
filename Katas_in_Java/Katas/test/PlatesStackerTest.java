import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.List;

import katas.PlatesStacker;
import katas.PlatesStacker.Plate;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.sun.tools.javac.code.Attribute.Array;

public class PlatesStackerTest {

	// You are given a set of n types of rectangular 2-D plates, where the i^th
	// plate has height h(i)
	// and width w(i) (all real numbers). You want to create a stack of plates
	// which is as tall as
	// possible, but you can only stack a plate on top of another plate if the
	// dimensions of the 2-D base
	// of the lower plate are each strictly larger than those of the 2-D base of
	// the higher plate. Of course,
	// you can rotate a plate so that any side functions as its base.

	private PlatesStacker stacker;

	@Before
	public void setUp() throws Exception {
		this.stacker = new PlatesStacker();
	}

	@Test
	public void testFindHeighestStack() {
		Plate [] plates = { this.stacker.new Plate(2,2), this.stacker.new Plate(2,3), this.stacker.new Plate(1,2)};
		List<Plate> stack = this.stacker.findHeighestStack( Arrays.asList(plates));
		assertTrue(stack.size() == 3);
	}

	
}
