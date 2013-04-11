import static org.junit.Assert.*;
import katas.BinaryTreeNode;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;


public class BinaryTreeNodeTest {

	private BinaryTreeNode<Integer> root;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		this.root = new BinaryTreeNode<Integer>(5);
		
		int [] datas = new int[] {2, 4, 10, 8,6,1}; 
		
		BinaryTreeNode<Integer> currentNode = this.root;
		for(int data:datas){
			BinaryTreeNode<Integer> node = new BinaryTreeNode<Integer>(data);
			if(data > currentNode.getData()){
				currentNode.setRight(node);
			}
			else{
				currentNode.setLeft(node);
			}
			
			currentNode = node;
		}
	}
	
	@Test
	public void testConstructor() {
		assertTrue(this.root.size() == 7);
	}
	
	@Test
	public void testPrint() {
		String stringRepresentationOfTree = this.root.print();
		assertEquals("5 2 4 10 8 6 1 ", stringRepresentationOfTree);
	}

	@Test
	public void testMaximumPathSum(){
	//Given a binary tree, find the maximum path sum.
	//The path may start and end at any node in the tree.
	//
	//For example:
	//Given the below binary tree,
	//
	//       1
	//      / \
	//     2   3
	//Return 6.
		
		
	}
}
