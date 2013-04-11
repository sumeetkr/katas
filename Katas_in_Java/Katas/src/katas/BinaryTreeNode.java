package katas;

import java.util.concurrent.atomic.AtomicReference;

import sun.tools.tree.ThisExpression;

public class BinaryTreeNode<T> {

	private T data;
	private BinaryTreeNode<T> parent;
	private BinaryTreeNode<T> left;
	private BinaryTreeNode<T> right;

	public BinaryTreeNode(T data) {
		this.data = data;
	}

	// public BinaryTreeNode(int[] datas){
	// // int [] datas = new int[] {2, 4, 10, 8,6,1};
	//
	// for(int data:datas){
	//
	// }
	// }

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

	private Integer sumInAPath(AtomicReference<T> sum, AtomicReference<T> maxSum) {

		Integer leftSum = (this.left != null ? this.left.sumInAPath(sum, maxSum)
				: 0) + (Integer) this.data;
		Integer rightSum = (this.right != null ? this.right.sumInAPath(sum, maxSum)
				: 0) + (Integer) this.data;
		Integer totalSum = (this.left != null ? this.left.sumInAPath(sum, maxSum)
				: 0)
				+ (this.right != null ? this.right.sumInAPath(sum, maxSum) : 0)
				+ (Integer) this.data;

//		maxSum.set( Math.max(leftSum, rightSum));
		return 0;
	}

}