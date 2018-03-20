package src.com.yxq.toolbean;

public class Treetest {
	
	public static void main(String[] args) {
		String preorder = "*ab";
		String inorder =  "a*b";
		int len = preorder.length();
		TreeNode39 proot = null;
//		���������
		inorder(ReBuild(preorder, inorder, len, proot));
	}

//	���������ǰ�����У��ؽ�������
	public static TreeNode39 ReBuild(String preorder, String inorder, int len,
			TreeNode39 proot) {
		if (preorder == null || inorder == null)
			return null;
//		����preorder�ַ����ĵ�һ��λ�õ��ַ������½ڵ㣬�ǵ�ǰ������ĸ��ڵ�
		TreeNode39 temp = new TreeNode39();
		temp.setValue(preorder.charAt(0));
		temp.setLeft(null);
		temp.setRight(null);
		
		if (proot == null)
			proot = temp;
//		ֻ��һ�����ڵ���Ϊpreorder������ֱ�ӷ���proot��Ҳ����temp
		if (len == 1) {
			return proot;
		}
		
//		��inorder���ַ������preorder�ĵ�һ���ַ��Ƚϣ�������ȣ���ǰ��������������������������������
		int i = 0;
		while (preorder.charAt(0) != inorder.charAt(i)) {
			i++;
			if (i >= len) break;
		}
//		����������
		int leftlen = i;
//		���������ȣ���1����Ϊ��Ϊ���ڵ�ķ��Ų�����ݹ������
		int rightlen = len - leftlen - 1;

//		�ؽ�������
		if (leftlen > 0) {
//			java��ֵ���ݻ��ƣ���ʱҪ���¸�proot.left��ֵ
//			�˴��ݹ��ʱ�򣬴��ݵ�preorder��ȥ�������ַ�����ִ���inorder�������������Ǻ���ȷ
			proot.setLeft(ReBuild(preorder.substring(1,leftlen+1), inorder.substring(0,leftlen), leftlen,
					proot.getLeft()));
		}
//		�ؽ�������
		if (rightlen > 0) {
			proot.setRight(ReBuild(preorder.substring(leftlen + 1),
					inorder.substring(leftlen + 1), rightlen, proot.getRight()));
		}
		return proot;

	}

//	�������
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
