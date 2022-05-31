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
func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
    if head?.val == val {
        return head?.next
    }
    // 遍历使用
    var node = head
    // 存放头结点使用
    let newNode = ListNode(0)
    newNode.next = head
    // 修改使用
    var tmpNode: ListNode? = newNode
    while node != nil && node?.val != val {
        tmpNode = node
        node = node?.next
    }
    if node != nil {
        tmpNode?.next = node?.next
    }
    //printListNode(newNode.next)
    return newNode.next
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
