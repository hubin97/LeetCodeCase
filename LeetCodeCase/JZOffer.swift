//
//  JZOffer.swift
//  LeetCodeCase
//
//  Created by Hubin_Huang on 2022/4/28.
//  Copyright © 2020 云图数字. All rights reserved.

import Foundation

// MARK: - -
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// 创建连续的n个节点链表
func createListNode(_ n: Int) -> ListNode {
    var last: ListNode?
    for i in 0..<n {
        let node = ListNode(n - i)
        node.next = last
        last = node
    }
    return last!
}

// 创建依据nums数组顺序的节点链表
func createListNode(_ nums: [Int]) -> ListNode {
    let count = nums.count
    var last: ListNode?
    for i in 0..<count {
        let node = ListNode(nums[count - i - 1])
        node.next = last
        last = node
    }
    return last!
}

// 打印链表
func printListNode(_ head: ListNode?) {
    var node = head
    while node != nil {
        print("node.Val: \(node!.val)")
        node = node?.next
    }
}

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

// 创建二叉树 ???
//func createTreeNode(_ nums: [Int?]) -> TreeNode {
//    var node: TreeNode?
//    var queue = nums
//    while queue.count > 0 {
//        if let val = queue.removeFirst() {
//            let tnode = TreeNode(val)
//        }
//    }
//}

//extension Array {
//    mutating func swap(at left: Int, right: Int) {
//        let tmp = self[left]
//        self[left] = self[right]
//        self[right] = tmp
//    }
//}

// MARK: 剑指 Offer 03. 数组中重复的数字
// [2, 3, 1, 0, 2, 5, 3]
func findRepeatNumber(_ nums: [Int]) -> Int? {
    var adapters = [Int]()
    for num in nums {
        if !adapters.contains(num) {
            adapters.append(num)
        } else {
            return num
        }
    }
    
    return nil
}

// MARK: 剑指 Offer 04. 二维数组中的查找
/**
 [
   [1,   4,  7, 11, 15],
   [2,   5,  8, 12, 19],
   [3,   6,  9, 16, 22],
   [10, 13, 14, 17, 24],
   [18, 21, 23, 26, 30]
 ]
 */
func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
    return matrix.flatMap({ $0 }).contains(target)
    //return matrix.flatMap({ $0 }).first(where: { $0 == target }) != nil
}

// MARK: 剑指 Offer 05. 替换空格
/**
 输入：s = "We are happy."
 输出："We%20are%20happy."
 */
func replaceSpace(_ s: String) -> String {
    //return s.replacingOccurrences(of: " ", with: "%20")
    return s.map({ String($0) == " " ? "%20": String($0) }).joined()
}

// MARK: 剑指 Offer 06. 从尾到头打印链表
func reversePrint(_ head: ListNode?) -> [Int] {
    var foot = head
    var headVals = [Int]()
    while foot != nil {
        headVals.append(foot!.val)
        print(foot!.val)
        foot = foot?.next
    }
    return headVals.reversed()
}

// MARK: 剑指 Offer 07. 重建二叉树  (迭代)
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard let rootVal = preorder.first, let midIndex = inorder.enumerated().first(where: { $0.element == rootVal })?.offset else { return nil }
    let rootNode = TreeNode(rootVal)
    var iLefts = [Int]()
    var iRights = [Int]()
    for i in 0..<inorder.count {
        if i == midIndex { continue }
        i < midIndex ? iLefts.append(inorder[i]): iRights.append(inorder[i])
    }

    var pLefts = [Int]()
    var pRights = [Int]()
    for p in 1..<preorder.count {
        p <= iLefts.count ? pLefts.append(preorder[p]): pRights.append(preorder[p])
    }
    rootNode.left = buildTree(pLefts, iLefts)
    rootNode.right = buildTree(pRights, iRights)
    return rootNode
}

// MARK: 剑指 Offer 09. 用两个栈实现队列
class CQueue {
    var queue: [Int]
    init() {
        queue = [Int]()
    }
    func appendTail(_ value: Int) {
        queue.append(value)
    }
    func deleteHead() -> Int {
        guard queue.count > 0 else { return -1 }
        return queue.removeFirst()
    }
}

// MARK: 剑指 Offer 10- I. 斐波那契数列
func fib(_ n: Int) -> Int {
//        递归迭代会超时, 且极耗cpu和内存
//        if n == 0 { return 0 }
//        if n == 1 { return 1 }
//        return fib(n - 1) + fib(n - 2)
    let mod = 1000000007
    var val = [Int]()
    for i in 0...n {
        if i == 0 {
            val.append(0)
        } else if i == 1 {
            val.append(1)
        } else {
            let ret = (val[i - 1] + val[i - 2]) % mod
            val.append(ret)
        }
    }
    return val[n]
}

// MARK: 剑指 Offer 11. 旋转数组的最小数字
func minArray(_ numbers: [Int]) -> Int {
    return numbers.sorted(by: <).first!
}

// MARK: 剑指 Offer 14- I. 剪绳子
//func cuttingRope(_ n: Int) -> Int {
//
//}

// MARK: 剑指 Offer 15. 二进制中1的个数
func hammingWeight(_ n: Int) -> Int {
    //return n.nonzeroBitCount
    //return String(n, radix: 2).filter({ $0 == "1" }).count
    
//    var num = n
//    var cnt = 0
//    while num != 0 {
//        cnt += num & 1
//        num = num >> 1
//    }
//    return cnt
    
//    var num = n
//    var cnt = 0
//    while num != 0 {
//        cnt += num % 2
//        num = num / 2
//    }
//    return cnt
  
    var num = n
    var cnt = 0
    while num != 0 {
        cnt += 1
        num = num & (num - 1)
    }
    return cnt
}

// MARK: 剑指 Offer 16. 数值的整数次方
func myPow(_ x: Double, _ n: Int) -> Double {
//        let count = n >= 0 ? n: -n
//        let oushu = count % 2 == 0
//        let yu = count % 2
//        guard x != 0 && x != 1 && x != -1 else {
//            return x == -1 && oushu ? -x: x
//        }
//        var num: Double = 1
//        for _ in 0..<count/2 {
//            num *= x
//        }
//        num = num * num
//        if !oushu {
//            for _ in 0..<yu {
//                num *= x
//            }
//        }
//        return n >= 0 ? num: 1/num
    return n > 0 ? quickMul(x, n):  1/quickMul(x, -n)
}

func quickMul(_ x: Double, _ n: Int) -> Double {
    guard n != 0 else { return 1 }
    // 官方递归
//        let num = quickMul(x, n/2)
//        return n % 2 == 0 ? num * num: num * num * x

    // 官方迭代
    var val = x
    var count = n
    var number: Double = 1
    while count > 0 {
        if count % 2 != 0 {
            number *= val
        }
        val *= x
        count /= 2
    }
    return number
}

// MARK: 剑指 Offer 17. 打印从1到最大的n位数
func printNumbers(_ n: Int) -> [Int] {
    var arr = [Int]()
    let max = Int(pow(Double(10), Double(n)) - 1)
    for i in 1...max {
        arr.append(i)
    }
    return arr
}

// MARK: 剑指 Offer 18. 删除链表的节点
/**
 解题思路：

 本题删除值为 val 的节点分需为两步：定位节点、修改引用。

 定位节点： 遍历链表，直到 head.val == val 时跳出，即可定位目标节点。
 修改引用： 设节点 cur 的前驱节点为 pre ，后继节点为 cur.next ；则执行 pre.next = cur.next ，即可实现删除 cur 节点。
 */
func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
    if head?.val == val { return head?.next }
    
    // 前驱节点
    var pre = head
    var cur = head?.next
    
    while cur != nil && cur?.val != val {
        pre = cur
        cur = cur?.next
    }
    
    // 修改引用 前驱节点next -> 后继节点next
    if cur != nil {
        pre?.next = cur?.next
    }
    return head
}

// MARK: 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面
func exchange(_ nums: [Int]) -> [Int] {
    //return nums.sorted(by: { $0 % 2 != 0 && $1 % 2 == 0 })
    var left = 0
    var right = nums.count - 1
    var arrs = nums
    while left <= right {
        if arrs[left] % 2 == 0 {
            arrs.swapAt(left, right)
            right -= 1
        } else {
            left += 1
        }
    }
    return arrs
}

// MARK: 剑指 Offer 22. 链表中倒数第k个节点
func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
//    var length = 0
//    var node = head
//    while node != nil {
//        length += 1
//        node = node?.next
//    }
//    var count = 0
//    var newHead = head
//    while newHead != nil {
//        if count == length - k {
//            return newHead
//        }
//        count += 1
//        newHead = newHead?.next
//    }
//    return nil

    // 快慢指针
    var fast = head
    var slow = head
    var kk = k
    while fast != nil {
        fast = fast?.next
        if kk <= 0 {
            slow = slow?.next
        }
        kk -= 1
    }
    return slow
}

// MARK: 剑指 Offer 24. 反转链表
func reverseList(_ head: ListNode?) -> ListNode? {
//    var node = head
//    var nodes = [ListNode]()
//    while node != nil {
//        nodes.append(node!)
//        node = node?.next
//    }
//    var newHead: ListNode?
//    var lastNode: ListNode?
//    for tnode in nodes {
//        newHead = tnode
//        newHead?.next = lastNode
//        lastNode = tnode
//    }
//    return newHead

    // 递归
//    if head == nil || head?.next == nil {
//        return head
//    }
//    let newHead: ListNode? = reverseList(head?.next)
//    head?.next?.next = head
//    head?.next = nil
//    return newHead

    // 迭代
    // (提供一个指向nil的空节点newHead, 然后再把首节点的next指向newHead, 此时首节点.next=nil; 接着把首节点赋值给newHead; 原节点依次往后遍历, 更新newHead)
    var node = head
    var newHead: ListNode?
    while node != nil {
        let tnode = node?.next
        node?.next = newHead
        newHead = node
        node = tnode
    }
    return newHead
}

// MARK: 剑指 Offer 25. 合并两个排序的链表
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }

    var node1 = l1
    var node2 = l2
    var node: ListNode? = ListNode(0)
    let newHead = node
    while node1 != nil && node2 != nil {
        if node1!.val < node2!.val {
            node?.next = node1
            node1 = node1?.next
        } else {
            node?.next = node2
            node2 = node2?.next
        }
        node = node?.next
    }
    node?.next = node1 == nil ? node2: node1
    return newHead?.next
}

// MARK: 剑指 Offer 28. 对称的二叉树
func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let tree = root else { return true }
    return checkTreeNode(tree.left, tree.right)
}

func checkTreeNode(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
    if l == nil && r == nil { return true }
    if l == nil || r == nil { return false }
    return l?.val == r?.val && checkTreeNode(l?.left, r?.right) && checkTreeNode(r?.left, l?.right)
}

// MAARK: 剑指 Offer 30. 包含min函数的栈
class MinStack {
    var stack: [Int]
    init() {
        stack = [Int]()
    }
    func push(_ x: Int) {
        stack.append(x)
    }
    func pop() {
        stack = stack.dropLast()
    }
    func top() -> Int {
        return stack.last!
    }
    func min() -> Int {
        return stack.sorted().first!
    }
}

// MARK: 剑指 Offer 32 - I. 从上到下打印二叉树
// BFS: 深度优先搜索, 一般使用队列先入先出方案处理
func levelOrder(_ root: TreeNode?) -> [Int] {
    guard let node = root else { return [] }
    var res = [Int]()
    var queue = [node]
    while queue.count > 0 {
        let tnode = queue.removeFirst()
        res.append(tnode.val)
        if let lnode = tnode.left {
            queue.append(lnode)
        }
        if let rnode = tnode.right {
            queue.append(rnode)
        }
    }
    return res
}

// MARK: 剑指 Offer 32 - II. 从上到下打印二叉树 II
func levelOrder1(_ root: TreeNode?) -> [[Int]] {
    // 方法 1
//    guard let node = root else { return [] }
//    var queue = [node]
//    var nodes = [[node]]
//    while queue.count > 0 {
//        // 此题关键在于处理层级关系
//        let level = queue.count
//        for _ in 0..<level {
//            let tnode = queue.removeFirst()
//            if let tl = tnode.left {
//                queue.append(tl)
//            }
//            if let tr = tnode.right {
//                queue.append(tr)
//            }
//        }
//        if queue.count > 0 {
//            nodes.append(queue)
//        }
//    }
//    return nodes.map({ $0.map({ $0.val }) })
    
    // 方法 2
    guard let node = root else { return [] }
    var queue = [node]
    var res = [[Int]]()
    while queue.count > 0 {
        let level = queue.count
        var tmp = [Int]()
        for _ in 0..<level {
            let tnode = queue.removeFirst()
            tmp.append(tnode.val)
            if let tl = tnode.left {
                queue.append(tl)
            }
            if let tr = tnode.right {
                queue.append(tr)
            }
        }
        res.append(tmp)
    }
    return res
}

// MARK: 剑指 Offer 32 - III. 从上到下打印二叉树 III
func levelOrder2(_ root: TreeNode?) -> [[Int]] {
    guard let node = root else { return [] }
    var queue = [node]
    var rnode = [[node]]
    var lev = 0 // 记录层级
    while !queue.isEmpty {
        let lcount = queue.count // 记录层级元素个数
        for _ in 0..<lcount {
            let tnode = queue.removeFirst()
            rnode.append([tnode])
            if let tl = tnode.left {
                queue.append(tl)
            }
            if let tr = tnode.right {
                queue.append(tr)
            }
        }
        if !queue.isEmpty {
            // 保证相隔的层级顺序相反, 但是遍历的数据源不改变
            if lev % 2 == 0 {
                rnode.append(queue.reversed())
            } else {
                rnode.append(queue)
            }
        }
        lev += 1
    }
    return rnode.map({ $0.map({ $0.val }) })
}

// MARK: 剑指 Offer 35. 复杂链表的复制
// 同 138. 复制带随机指针的链表 (描述更清楚) https://leetcode.cn/problems/copy-list-with-random-pointer/
class FZListNode {
    var val: Int
    var next: FZListNode?
    var random: FZListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

extension FZListNode: Hashable {
    
    static func == (lhs: FZListNode, rhs: FZListNode) -> Bool {
        return lhs == rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(ObjectIdentifier(self))
    }
}

//var hashMap = [Node:Node]()
//func copyRandomList(_ head: Node?) -> Node? {
//    guard let head = head else { return nil }
//
//    if hashMap[head] == nil {
//        let node = Node.init(head.val)
//        hashMap[head] = node
//        node.next = copyRandomList(head.next)
//        node.random = copyRandomList(head.random)
//    }
//    return hashMap[head]
//}

//  此方法时间空间不如上面/...
func copyRandomList(_ head: FZListNode?) -> FZListNode? {
    
    // 排除空链表
    guard head != nil else { return nil }
    // 遍历链表,并依次创建新节点; 使用哈希表记录 [旧节点: 新节点] 对应关系
    var hashMap = [FZListNode: FZListNode]()
    var node = head
    while node != nil {
        let newHead = FZListNode(node!.val)
        newHead.next = node?.next
        newHead.random = node?.random
        
        hashMap[node!] = newHead
        node = node?.next
    }
    
    // 修改 新节点的next和random指向
    node = head
    while node != nil {
        let newNode = hashMap[node!]
        if let next = node?.next {
            newNode?.next = hashMap[next]
        }
        if let random = node?.random {
            newNode?.random = hashMap[random]
        }
        node = node?.next
    }
    return hashMap[head!]
}

// MARK: 剑指 Offer 39. 数组中出现次数超过一半的数字
func majorityElement(_ nums: [Int]) -> Int {
    // 1. hashmap
//    let count = nums.count
//    var hashMap: [Int: Int] = [:]
//    for num in nums {
//        if hashMap.keys.contains(num) {
//            hashMap[num]! += 1
//        } else {
//            hashMap[num] = 1
//        }
//    }
//    return hashMap.filter({ $0.value > count/2 }).map({ $0.key }).first!
    
    //2. 摩尔投票
    /// 投票法简单来说就是不同则抵消，占半数以上的数字必然留到最后。 摩尔投票法找的其实不是众数，而是占一半以上的数
    /// https://leetcode.cn/problems/shu-zu-zhong-chu-xian-ci-shu-chao-guo-yi-ban-de-shu-zi-lcof/solution/mian-shi-ti-39-shu-zu-zhong-chu-xian-ci-shu-chao-3/
    var x = 0, votes = 0
    for num in nums {
        if votes == 0 {
            x = num
        }
        votes += x == num ? 1: -1
    }
    return x
}

// MARK: 剑指 Offer 40. 最小的k个数
// https://blog.51cto.com/u_8392210/category9
// 桶排序 https://blog.51cto.com/u_8392210/3731584
func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
    //return Array<Int>(arr.sorted().prefix(k))
    //return Array(arr.sorted()[0..<k])
    
    // 选择排序 5-54
    var nums = arr
    for i in 0..<nums.count - 1 {
        var min = i
        for j in (i + 1)..<nums.count {
            if nums[min] > nums[j] {
                min = j
            }
        }
        nums.swapAt(i, min)
    }
    return Array(nums[0..<k])

//    // 冒泡排序  5-5
//    var nums = arr
//    for i in 0..<nums.count - 1 {
//        for j in 0..<nums.count - i - 1 {
//            if nums[j] > nums[j + 1] {
//                nums.swapAt(j, j + 1)
//            }
//        }
//    }
//    return Array(nums[0..<k])

//    // 桶排序 空间换时间
//    var nums = arr
//    var maxVal = nums.first!
//    for num in nums {
//        maxVal = max(num, maxVal)
//    }
//    let size = maxVal + 1
//    var buckets = Array(repeating: 0, count: size)
//    for num in nums {
//        if buckets[num] >= 0 {
//            buckets[num] += 1
//        } else {
//            buckets[num] = 0
//        }
//    }
//    var sort: [Int] = []
//    for i in 0..<buckets.count where buckets[i] > 0 {
//        if buckets[i] > 1 {
//            sort.append(contentsOf: Array(repeating: i, count: buckets[i]))
//        } else {
//            sort.append(i)
//        }
//    }
//    return Array(sort[0..<k])
}

// MARK: 剑指 Offer 41. 数据流中的中位数
class MedianFinder {
    
    var nums: [Int] = []
    init() {}
    
    func addNum(_ num: Int) {
        nums.append(num)
        nums.sort(by: <)
    }
    
    func findMedian() -> Double? {
        guard !nums.isEmpty else { return nil }
        guard nums.count > 1 else { return Double(nums.first!) }
        let j = nums.count / 2
        if nums.count % 2 == 0 {
            let k = nums.count / 2 - 1
            return Double(nums[j] + nums[k]) / 2
        }
        return Double(nums[j])
    }
}

// MARK: 剑指 Offer 42. 连续子数组的最大和
/**
 https://leetcode.cn/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof/solution/lian-xu-zi-shu-zu-de-zui-da-he-by-leetco-tiui/
 https://leetcode.cn/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof/solution/mian-shi-ti-42-lian-xu-zi-shu-zu-de-zui-da-he-do-2/
 */
func maxSubArray(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    let count = nums.count
    var dp = Array.init(repeating: 0, count: count)
    dp[0] = nums.first!
    var res = dp[0]
    for i in 1..<count {
        dp[i] = max(dp[i - 1] + nums[i], nums[i])
        res = max(dp[i], res)
    }
    return res
}

// MARK: 剑指 Offer 45. 把数组排成最小的数
func minNumber(_ nums: [Int]) -> String {
    return nums.map({ String($0) }).sorted(by: { Int($0 + $1)! < Int($1 + $0)! }).joined()
}

// MARK: 剑指 Offer 46. 把数字翻译成字符串
// 相关题: 70:爬楼梯; 91:解码问题 198:打家劫舍
func translateNum(_ num: Int) -> Int {
    let nums = String(num).map({ String($0) })
    let count = nums.count
    guard count > 1 else { return 1 }
    var dp = Array(repeating: 0, count: count)
    dp[0] = 1
    for i in 1..<count {
        dp[i] = dp[i - 1]
        if let s = Int(nums[i - 1]), let g = Int(nums[i]) {
            let cnum = 10 * s + g
            if cnum > 9 && cnum < 26 {
                if i >= 2 {
                    dp[i] += dp[i - 2]
                } else {
                    dp[i] += 1
                }
            }
        }
    }
    return dp[count - 1]
}

// MARK: 剑指 Offer 47. 礼物的最大价值
func maxValue(_ grid: [[Int]]) -> Int {
    guard let meta = grid.first, !meta.isEmpty else { return 0 }
    let row = grid.count
    let col = meta.count
    var dp = Array(repeating: Array(repeating: 0, count: col), count: row)
    dp[0][0] = grid[0][0]
    var res = dp[0][0]
    for i in 0..<row {
        for j in 0..<col {
            // 排除首个dp
            if i == 0 && j == 0 { continue }
            // dp[i][j]对比它的左边一项或者上面一项
            if i > 0 { // 规避越界问题
                dp[i][j] = max(dp[i][j], dp[i - 1][j] + grid[i][j])
            }
            if j > 0 { // 规避越界问题
                dp[i][j] = max(dp[i][j], dp[i][j - 1] + grid[i][j])
            }
            res = max(dp[i][j], res)
        }
    }
    return res
}

// MARK: 剑指 Offer 48. 最长不含重复字符的子字符串
func lengthOfLongestSubstring(_ s: String) -> Int {
    guard !s.isEmpty else { return 0 }
    let array = s.map({ String($0) })
    let count = array.count
    guard count > 1 else { return 1 }
    
    // 滑动窗口
    var res = 0
    for i in 0..<count {
        var j = i + 1
        var tmp = 0
        while j < count && !array[i..<j].contains(array[j]) {
            j += 1
        }
        print(array[i..<j])
        // 计算切片长度, 长度一定会 >= 1
        tmp = tmp < j - i ? j - i: tmp + 1
        res = max(res, tmp)
    }
    return res
}

// MARK: 剑指 Offer 50. 第一个只出现一次的字符
func firstUniqChar(_ s: String) -> Character {
//    var chs = [String]()
//    var map = [String: Int]()
//    for ch in s {
//        let st = String(ch)
//        if !chs.contains(st) {
//            chs.append(st)
//            map[st] = 1
//        } else {
//            map[st] = map[st]! + 1
//        }
//    }
//    for st in chs {
//        if map[st] == 1 {
//            return Character(st)
//        }
//    }
//    return Character(" ")

    var hashMap = [Int]()
    for _ in 0..<26 {
        hashMap.append(0)
    }
    
    for ch in s {
        let idx = Int(ch.asciiValue! - 96) - 1
        let value = hashMap[idx]
        hashMap[idx] = value + 1
    }
    for ch in s {
        let idx = Int(ch.asciiValue! - 96) - 1
        if hashMap[idx] == 1 {
            return Character(String(ch))
        }
    }
    return Character(" ")
}

// MARK: 剑指 Offer 52. 两个链表的第一个公共节
// 160. 相交链表
// 输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
//[5,0,1,8,4,5,4,1,8,4,5]
//[4,1,8,4,5,5,0,1,8,4,5]
// 输入：intersectVal = 2, listA = [0,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
//[0,9,1,2,4,3,2,4]
//[3,2,4,0,9,1,2,4]
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    // nodeA 有毒 ???
    var currA = headA
    var currB = headB
    while currA !== currB {
        currA = (currA != nil) ? currA?.next: headB
        currB = (currB != nil) ? currB?.next: headA
    }
    return currA
}

// MARK: 剑指 Offer 53 - I. 在排序数组中查找数字 I
func search(_ nums: [Int], _ target: Int) -> Int {
    //return nums.filter({ $0 == target }).count
    var left = 0
    var right = nums.count - 1
    while left <= right {
        let m = (left + right) / 2
        let mid = nums[m]
        if mid >= target { // 找左边界下标
            right = m - 1
        } else {
            left = m + 1
        }
    }
    
    if nums[left] != target { return 0 }
    
    var L = left
    var R = nums.count - 1
    while L <= R {
        let m = (L + R) / 2
        let mid = nums[m]
        if mid <= target { // 找右边界下标
            L = m + 1
        } else {
            R = m - 1
        }
    }
    return R - left + 1
}

// MARK: 剑指 Offer 53 - II. 0～n-1中缺失的数字
func missingNumber(_ nums: [Int]) -> Int {
//    let last = nums.last!
//    let first = nums.first!
//    if nums.count == 1 && first != 0 { return 0 }
//    for index in 0...last {
//        if index != nums[index] {
//            return index
//        }
//    }
//    return last + 1
    
//    var left = 0
//    let right = nums.last!
//    while left <= right {
//        if left != nums[left] {
//            break
//        }
//        left += 1
//    }
//    return nums.first != 0 ? 0: left

    var left = 0
    var right = nums.count - 1
    while left <= right {
        let mid = (left + right) / 2
        if mid == nums[mid] {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return left
}

// MARK: 剑指 Offer 55 - I. 二叉树的深度
func maxDepth(_ root: TreeNode?) -> Int {
    // BFS
//    guard let tree = root else { return 0 }
//    var queue: [TreeNode] = [tree]
//    var depth = 0
//    while !queue.isEmpty {
//        var bunch = queue.count
//        while bunch > 0 {
//            let node = queue.removeFirst()
//            if let leftChild = node.left {
//                queue.append(leftChild)
//            }
//            if let rightChild = node.right {
//                queue.append(rightChild)
//            }
//            bunch -= 1
//        }
//        depth += 1
//    }
//    return depth

    // DFS
    guard let tree = root else { return 0 }
    return max(maxDepth(tree.left), maxDepth(tree.right)) + 1
}

// MARK: 剑指 Offer 55 - II. 平衡二叉树
func isBalanced(_ root: TreeNode?) -> Bool {
    guard let tree = root else { return true }
    return abs(maxDepth(tree.left) - maxDepth(tree.right)) < 2 && isBalanced(tree.left) && isBalanced(tree.right)
}

// MARK: 剑指 Offer 56 - I. 数组中数字出现的次数
/// 位运算怎么做???
func singleNumbers(_ nums: [Int]) -> [Int] {
    var dict: [Int: Int] = [:]
    for num in nums {
        if dict.keys.contains(num) {
            dict[num]! += 1
        } else {
            dict[num] = 1
        }
    }
    return dict.filter({ $0.value == 1 }).map({ $0.key })
}

// MARK: 剑指 Offer 57. 和为s的两个数字
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    // 超时
//    var arr = [Int]()
//    for num in nums {
//        if nums.contains(target - num) {
//            arr = [num, target - num]
//            break
//        }
//    }
//    return arr
    
    // 双指针
//    var L = 0
//    var R = nums.count - 1
//    while L < R {
//        if nums[L] + nums[R] > target {
//            R -= 1
//        } else if nums[L] + nums[R] < target {
//            L += 1
//        } else {
//            return [nums[L], nums[R]]
//        }
//    }
//    return []
    
    // 优化  用例跑完 时间上快 3-400ms
    var L = 0
    var R = nums.count - 1
    while nums[L] + nums[R] != target && L < R {
        if nums[L] + nums[R] > target {
            R -= 1
        } else {
            L += 1
        }
    }
    return [nums[L], nums[R]]
}

// MARK: 剑指 Offer 58 - I. 翻转单词顺序
func reverseWords(_ s: String) -> String {
    // 原生方法求解
    return s.split(separator: " ").map({ String( $0) }).reversed().joined(separator: " ")
    
    // 双指针
//    var arr = s.split(separator: " ").map({ String( $0) })
//    var l = 0
//    var r = arr.count - 1
//    while l < r {
//        arr.swapAt(l, r)
//        l += 1
//        r -= 1
//    }
//    return arr.joined(separator: " ")
}

// MARK: 剑指 Offer 58 - II. 左旋转字符串
func reverseLeftWords(_ s: String, _ n: Int) -> String {
//    var lefts = [String]()
//    var rights = [String]()
//    for (offset, element) in s.enumerated() {
//        if offset < n {
//            lefts.append(String(element))
//        } else {
//            rights.append(String(element))
//        }
//    }
//    rights.append(contentsOf: lefts)
//    return rights.joined()
//    return String(s.dropFirst(n) + s.prefix(n))
    return String(s.suffix(s.count - n) + s.prefix(n))
}

// MARK: 剑指 Offer 61. 扑克牌中的顺子
func isStraight(_ nums: [Int]) -> Bool {
    // 1. 去重  2. maxVal - minVal < 5
    let arr = nums.filter({ $0 != 0 }).sorted()
    if Set(arr).count < arr.count { return false }
    return arr.last! - arr.first! < 5
}

// MARK: 剑指 Offer 62. 圆圈中最后剩下的数字
// https://blog.csdn.net/u011500062/article/details/72855826
func lastRemaining(_ n: Int, _ m: Int) -> Int {
    var p = 0
    for i in 2...n {
        p = (p + m) % i
    }
    return p + 1
}

// MARK: 剑指 Offer 63. 股票的最大利润
func maxProfit(_ prices: [Int]) -> Int {
//    // 暴力求解
//    var offsets = [Int]()
//    for i in 0..<prices.count {
//        for j in (i + 1)..<prices.count {
//            let offset = prices[j] - prices[i]
//            if offset > 0 {
//                offsets.append(offset)
//            }
//        }
//    }
//    guard offsets.count > 0 else { return 0 }
//    return offsets.sorted(by: <).last!
    
    // 动态规划
    var profit = 0
    var defVal = Int.max
    for price in prices {
        defVal = min(defVal, price)
        profit = max(profit, price - defVal)
    }
    return profit
}

// MARK: 剑指 Offer 64. 求1+2+…+n
var res = 0
func sumNums(_ n: Int) -> Int {
    //return Array(1...n).reduce(0, +)
    _ = n > 1 && sumNums(n - 1) > 0
    res += n
    return res
}

// MARK: 剑指 Offer 65. 不用加减乘除做加法
//func add(_ a: Int, _ b: Int) -> Int {
//
//}

// MARK: 剑指 Offer 66. 构建乘积数组
func constructArr(_ a: [Int]) -> [Int] {
    // 暴力求解 不出意外超时
//    var nums: [Int] = []
//    for i in 0..<a.count {
//        var res = 1
//        for j in 0..<a.count {
//            if i == j { continue }
//            res *= a[j]
//        }
//        nums.append(res)
//    }
//    return nums
    
    let cut = a.count
    guard cut > 0 else { return [] }
    var dp = Array(repeating: 0, count: cut)
    dp[0] = 1
    // 对角线分区 -> 左下角
    for i in 1..<cut {
        dp[i] = dp[i - 1] * a[i - 1]
    }
    // 右上角
    var tmp = 1
    for j in 1..<cut {
        let idx = cut - j - 1
        tmp *= a[idx + 1]
        dp[idx] *= tmp
    }
    return dp
}
