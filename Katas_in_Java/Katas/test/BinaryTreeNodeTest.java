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
		int[] datas = new int[] { 2, 4, 10, 8, 6, 1 };
		insertData(datas);
	}

	private void insertData(int[] datas) {

		BinaryTreeNode<Integer> currentNode = this.root;
		for (int data : datas) {
			this.root.insert(data);
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
	public void testMaximumPathSumCase1() {
		// Given a binary tree, find the maximum path sum.
		// The path may start and end at any node in the tree.
		//
		// For example:
		// Given the below binary tree,
		//
		// 1
		// / \
		// 2 3
		// Return 6.

		this.root = new BinaryTreeNode<Integer>(1);
		int[] datas = new int[] { 2, 3 };
		insertData(datas);

		int maxSum = this.root.maxSumPath();
		assertTrue(maxSum == 6);
	}

	@Test
	public void testMaximumPathSumCase2() {

		this.root = new BinaryTreeNode<Integer>(5);
		int[] datas = new int[] { 2, 3, 7 };
		insertData(datas);

		int maxSum = this.root.maxSumPath();
		assertTrue(maxSum == 15);
	}

	@Test
	public void testLowestCommonAncestor() {
		// This is Part II of Lowest Common Ancestor of a Binary Tree.
		// If you need to find the lowest common ancestor without parent
		// pointers,
		// please read Lowest Common Ancestor of a Binary Tree Part I.
		// _______3______
		// / \
		// ___5__ ___1__
		// / \ / \
		// 6 _2 0 8
		// / \
		// 7 4
		// If you are not so sure about the definition of lowest common ancestor
		// (LCA),
		// please refer to my previous post: Lowest Common Ancestor of a Binary
		// Search Tree (BST)
		// or the definition of LCA here. Using the tree above as an example,
		// the LCA of nodes 5
		// and 1 is 3. Please note that LCA for nodes 5 and 4 is 5.
	}

	@Test
	public void testLowestCommonAncestorCase2() {
		this.root = new BinaryTreeNode<Integer>(5);
		int[] datas = new int[] { 2, 3, 7 };
		insertData(datas);

		assertTrue(root.findLowestCommonAncestor(root, 2, 3) == 2);
		assertTrue(root.findLowestCommonAncestor(root, 2, 7) == 5);
	}
	
	@Test
	public void testIsTreeSymmetric(){
		
	}
}
