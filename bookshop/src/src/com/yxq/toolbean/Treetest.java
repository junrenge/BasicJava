package src.com.yxq.toolbean;

public class Treetest {
	
	public static void main(String[] args) {
		String preorder = "*ab";
		String inorder =  "a*b";
		int len = preorder.length();
		TreeNode39 proot = null;
//		中序遍历树
		inorder(ReBuild(preorder, inorder, len, proot));
	}

//	根据中序和前序序列，重建二叉树
	public static TreeNode39 ReBuild(String preorder, String inorder, int len,
			TreeNode39 proot) {
		if (preorder == null || inorder == null)
			return null;
//		根据preorder字符串的第一个位置的字符构造新节点，是当前这棵树的根节点
		TreeNode39 temp = new TreeNode39();
		temp.setValue(preorder.charAt(0));
		temp.setLeft(null);
		temp.setRight(null);
		
		if (proot == null)
			proot = temp;
//		只有一个根节点作为preorder，所以直接返回proot，也就是temp
		if (len == 1) {
			return proot;
		}
		
//		将inorder的字符逐个与preorder的第一个字符比较，若果相等，则前面是属于左子树，后面是属于右子树
		int i = 0;
		while (preorder.charAt(0) != inorder.charAt(i)) {
			i++;
			if (i >= len) break;
		}
//		左子树长度
		int leftlen = i;
//		右子树长度，减1是因为作为跟节点的符号不参与递归计算了
		int rightlen = len - leftlen - 1;

//		重建左子树
		if (leftlen > 0) {
//			java的值传递机制，此时要重新给proot.left赋值
//			此处递归的时候，传递的preorder是去除了首字符后的字串，inorder的限制条件不是很明确
			proot.setLeft(ReBuild(preorder.substring(1,leftlen+1), inorder.substring(0,leftlen), leftlen,
					proot.getLeft()));
		}
//		重建右子树
		if (rightlen > 0) {
			proot.setRight(ReBuild(preorder.substring(leftlen + 1),
					inorder.substring(leftlen + 1), rightlen, proot.getRight()));
		}
		return proot;

	}

//	中序遍历
	public static void inorder(TreeNode39 root) {
		if (root != null) {
			inorder(root.getLeft());
			System.out.print(root.getValue()+" ");
			inorder(root.getRight());
		}
	}

}

class TreeNode39 {
	
	private TreeNode39 left;
	private TreeNode39 right;
	private char value;

	public TreeNode39 getLeft() {
		return left;
	}

	public void setLeft(TreeNode39 left) {
		this.left = left;
	}

	public TreeNode39 getRight() {
		return right;
	}

	public void setRight(TreeNode39 right) {
		this.right = right;
	}

	public char getValue() {
		return value;
	}

	public void setValue(char value) {
		this.value = value;
	}
}
