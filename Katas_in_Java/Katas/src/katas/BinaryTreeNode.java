package katas;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

import com.sun.corba.se.impl.orbutil.graph.Node;

import sun.tools.tree.ThisExpression;

public class BinaryTreeNode<T extends Integer> {

	private T data;
	private BinaryTreeNode<T> parent;
	private BinaryTreeNode<T> left;
	private BinaryTreeNode<T> right;

	public BinaryTreeNode(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public BinaryTreeNode<T> getParent() {
		return this.parent;
	}

	public void setParent(BinaryTreeNode<T> binaryTreeNode) {
		this.parent = binaryTreeNode;
	}

	public BinaryTreeNode<T> getLeft() {
		return this.left;
	}

	public void setLeft(BinaryTreeNode<T> binaryTreeNode) {
		this.left = binaryTreeNode;
	}

	public BinaryTreeNode<T> getRight() {
		return this.right;
	}

	public void setRight(BinaryTreeNode<T> binaryTreeNode) {
		this.right = binaryTreeNode;
	}

	public int size() {

		return (this.left != null ? this.left.size() : 0)
				+ (this.right != null ? this.right.size() : 0) + 1;
	}

	public String print() {
		String dataAsString = String.valueOf(this.data) + " ";

		return dataAsString + (this.left != null ? this.left.print() : "")
				+ (this.right != null ? this.right.print() : "");

	}

	public T maxSumPath() {

		AtomicReference<T> sum = new AtomicReference(0);
		AtomicReference<T> maxSum = new AtomicReference(0);
		sumInAPath(sum, maxSum);

		return maxSum.get();
	}

	public void insert(T value) {
		BinaryTreeNode<T> newNode = new BinaryTreeNode<T>(value);
		insertHelper(this, newNode);
	}

	public int findLowestCommonAncestor(BinaryTreeNode<T> root, int a, int b) {
		AtomicReference<BinaryTreeNode<T>> matched = new AtomicReference<BinaryTreeNode<T>>();

		traverse(root, a, b, matched);

		return matched.get().data;
	}

	public void convertBinaryTreeInToSumBinaryTree(BinaryTreeNode root) {

	}

	public boolean isTreeSymmetric() {
		// do breadth first search
		List<BinaryTreeNode<Integer>> root = new ArrayList<BinaryTreeNode<Integer>>();
		root.add((BinaryTreeNode<Integer>) this);
		
		return verifyChildNodesForSymmetry(root);
	}
	
	public BinaryTreeNode<Integer> findKthClosetNode(BinaryTreeNode<Integer> node){
		//Find the 3rd closest element in a bst.You will be given a pointer to root and a value 
		//within the tree against which the closest has to be figured out. (closeness is in terms 
		//of value, not by distance ) and then follow up qn: for finding the kth closest in a bst.
		BinaryTreeNode<Integer> nearestNode = new BinaryTreeNode<Integer>(0);
		
		
		return nearestNode;
			
	}

	public int sum(BinaryTreeNode<Integer> node){
		if(node == null) return 0;
		int left = sum(node.getLeft());
		int right = sum(node.getRight());
		
		node.setData(left+ right + node.getData());
		return node.getData();
	}
	
	public static BinaryTreeNode<Integer> getPredecessor(BinaryTreeNode<Integer> node){
		if(node.getLeft() != null){
			return getMaxOfLeftSubTree(node);
		}
		else
		{
			return getParentNodeWithLesserValue(node);
		}
	}
	
	public static void copyByTraversingInOrder(BinaryTreeNode<Integer> node, BinaryTreeNode<Integer> clonedNode){
		if(node == null) return;
		if(node.getLeft() != null){
			BinaryTreeNode<Integer> leftCopy = new BinaryTreeNode<Integer>(node.getLeft().getData());	
			clonedNode.setLeft(leftCopy);
			copyByTraversingInOrder(node.getLeft(), leftCopy);
		}
		
		if(node.getRight() != null){
			BinaryTreeNode<Integer> rightCopy = new BinaryTreeNode<Integer>(node.getRight().getData());
			clonedNode.setRight(rightCopy);
			copyByTraversingInOrder(node.getRight(), rightCopy);
		}
		
	}
	
	private static BinaryTreeNode<Integer> getMaxOfLeftSubTree(BinaryTreeNode<Integer> node) {
		if(node.getLeft() == null) return null;
		
		BinaryTreeNode<Integer> currentNode = node.getLeft();
		while(currentNode.getRight() != null){
			currentNode = currentNode.getRight();
		}
		return currentNode;
	}
	
	private static BinaryTreeNode<Integer> getParentNodeWithLesserValue(BinaryTreeNode<Integer> node) {
		if(node == null) return null;
		
		BinaryTreeNode<Integer> parent = node.getParent();
		while(parent != null && parent.getData() > node.getData()){
			parent = node.getParent();
		}
		
		return parent;
	}
	
	private boolean verifyChildNodesForSymmetry(List<BinaryTreeNode<Integer>> nodes) {
		boolean isSymmetric = true;

		//verify symmetry
		for (int index = 0; index < nodes.size()/2; index++) {
			if(nodes.get(index).data != nodes.get(nodes.size() - index -1).data){
				return false;
			}
		}
		
		List<BinaryTreeNode<Integer>> childNodes = new ArrayList<BinaryTreeNode<Integer>>();
		for (BinaryTreeNode<Integer> binaryTreeNode : nodes) {
			if(binaryTreeNode.left != null){
				childNodes.add(binaryTreeNode.left);	
			}
			if(binaryTreeNode.right != null){
				childNodes.add(binaryTreeNode.right);	
			}
		}
		
		if(childNodes.size()>0){
			return verifyChildNodesForSymmetry(childNodes);
		}
		else {
			return isSymmetric;
		}
		
	}

	private boolean traverse(BinaryTreeNode<T> node, int a, int b,
			AtomicReference<BinaryTreeNode<T>> matched) {

		boolean found = false;

		if (node == null || matched.get() != null) {
			return false;
		}

		if (node.data == a || node.data == b) {
			found = true;
		}

		boolean foundOnLeft = traverse(node.left, a, b, matched);
		boolean foundOnRight = traverse(node.right, a, b, matched);

		if ((foundOnLeft && foundOnRight) || (foundOnLeft && found)
				|| (foundOnRight && found)) {
			matched.set(node);
		}

		return found;
	}

	private void insertHelper(BinaryTreeNode<T> node,BinaryTreeNode<T> newNode) {
		
		if (newNode.getData() < node.data) {
			if (node.left == null){
				node.left = newNode;
				newNode.parent = node.left;
			}
			else
				insertHelper(node.left, newNode);
		} else {
			if (node.right == null){
				node.right = newNode;
				newNode.parent = node.right;
			}
			else
				insertHelper(node.right, newNode);
		}
	}

	private Integer sumInAPath(AtomicReference<T> sum, AtomicReference<T> maxSum) {

		Integer leftSum = (this.left != null ? this.left
				.sumInAPath(sum, maxSum) : 0) + (Integer) this.data;
		Integer rightSum = (this.right != null ? this.right.sumInAPath(sum,
				maxSum) : 0) + (Integer) this.data;
		Integer totalSum = (this.left != null ? this.left.sumInAPath(sum,
				maxSum) : 0)
				+ (this.right != null ? this.right.sumInAPath(sum, maxSum) : 0)
				+ (Integer) this.data;

		Integer localMax = Math.max(Math.max(leftSum, rightSum), totalSum);

		if (localMax > (Integer) maxSum.get()) {
			maxSum.set((T) (Object) Math.max(Math.max(leftSum, rightSum),
					totalSum));
		}

		return Math.max(leftSum, rightSum);
	}

}
