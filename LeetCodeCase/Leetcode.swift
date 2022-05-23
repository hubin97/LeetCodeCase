//
//  Leetcode.swift
//  HBSwiftKit_Example
//
//  Created by Hubin_Huang on 2022/4/19.
//  Copyright © 2020 云图数字. All rights reserved.

import Foundation

class Solution {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        for i in 0..<nums.count - 1 {
//            for j in (i + 1)..<nums.count where nums[i] + nums[j] == target {
//                return [i, j]
//            }
//        }
//        return []
//    }

//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        for i in 0..<nums.count - 1 {
//            let value = target - nums[i]
//            if let j = nums.drop(while: { $0 == i}).firstIndex(of: value), nums.contains(value) {
//                return [i, j]
//            }
//        }
//        return []
//    }

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [Int]()
        var dict = [Int: Int]()
        for i in 0 ..< nums.count {
            let other = target - nums[i]
            if dict.keys.contains(other) {
                res.append(i)
                res.append(dict[other]!)
                return res
            }
            dict[nums[i]] = i
        }
        return res
    }

//    // dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext
//    func lengthLongestPath(_ input: String) -> Int {
//        //input.forEach({ print($0) })
//        //input.filter({ $0 == Character.init("\t") })
//        let mkdirs = input.components(separatedBy: "\n\t")
//        if mkdirs.count > 0 {
//
//        } else {
//            let omkdirs = input.components(separatedBy: "\n")
//            if omkdirs.count == 0 && input {
//                return 0
//            }
//        }
//        return 0
//    }

    ///# 461. 汉明距离
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        //return (x ^ y).nonzeroBitCount
        return String(x ^ y, radix: 2).filter({ $0 == "1"}).count
    }

    ///#228. 汇总区间
    func summaryRanges(_ nums: [Int]) -> [String] {
        var ranges = [[Int]]()
        var metas = [Int]()
        for idx in 0..<nums.count {
            let last = (idx > 0) ? nums[idx - 1] : nil
            let value = nums[idx]
            if let lastValue = last {
                if value - lastValue > 1 {
                    ranges.append(metas)
                    metas.removeAll()
                }
            }
            metas.append(value)
            if idx == nums.count - 1 && metas.count > 0 {
                ranges.append(metas)
            }
        }
        return ranges.map({ $0.count == 1 ? "\($0.last!)": "\($0.first!)->\($0.last!)" })
    }

    ///# 1024. 视频拼接
    /**
     //let clips = [[0,2],[4,6],[8,9],[1,9],[1,5],[5,9]]
     //let clips = [[0,1],[6,8],[0,2],[5,6],[0,4],[0,3],[6,7],[1,3],[4,7],[1,4],[2,5],[2,6],[3,4],[4,5],[5,7],[6,9]]  time = 9
     */
    func videoStitching(_ clips: [[Int]], _ time: Int) -> Int {
//        let first_lasts = clips.filter({ $0.first == 0 }).map({ $0.last! })
//        let last_firsts = clips.filter({ $0.last == time }).map({ $0.first! })
//        guard first_lasts.count > 0 && last_firsts.count > 0 else { return -1 }
        //let medians = clips.filter({ first_lasts.contains($0.first!) })
        var dp = [Int]()
        for i in 0...time {
            dp.append(i == 0 ? 0: Int.max - 1)
        }
        for i in 1...time {
            for j in 0..<clips.count {
                if clips[j][0] < i && i <= clips[j][1] {
                    dp[i] = min(dp[i], dp[clips[j][0]] + 1)
                }
            }
        }
        return (dp[time] == Int.max - 1) ? -1: dp[time]
    }

    ///# 54. 螺旋矩阵
    /// let ret = Solution().spiralOrder(Solution().spiralArray(x: 5, y: 5))
    /// 3 * 3  [1,2,3,6,9,8,7,4,5]
    /// 4 * 4  [1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7, 11, 10]
    /// 5 * 5 [1, 2, 3, 4, 5, 10, 15, 20, 25, 24, 23, 22, 21, 16, 11, 6, 7, 8, 9, 14, 19, 18, 17, 12, 13]
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        //let count = matrix.flatMap({ $0 }).count
        var xmin = 0
        var ymin = 0
        var xmax = matrix.first!.count - 1
        var ymax = matrix.count - 1
        var list = [Int]()
        print("matrix: \(matrix)")
        //while list.count < count {
        while xmin <= xmax && ymin <= ymax {
            // 左 -> 右
            var x = xmin
            while x <= xmax {
                list.append(matrix[ymin][x])
                x += 1
            }
            ymin += 1

            // 上 -> 下
            var y = ymin
            while y <= ymax {
                list.append(matrix[y][xmax])
                y += 1
            }
            xmax -= 1

            if ymin > ymax || xmin > xmax {
                return list
            }

            // 右 -> 左
            x = xmax
            while x >= xmin {
                list.append(matrix[ymax][x])
                x -= 1
            }
            ymax -= 1

            // 下 -> 上
            y = ymax
            while y >= ymin {
                list.append(matrix[y][xmin])
                y -= 1
            }
            xmin += 1
        }
        return list
    }

    func spiralOrder1(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1

        while top <= bottom && left <= right {
            //! 左上 到  右上
            var index = left
            while index <= right {
                res.append(matrix[top][index])
                index += 1
            }
            top += 1

            //! 右上到右下
            index = top
            while index <= bottom {
                res.append(matrix[index][right])
                index += 1
            }
            right -= 1

            if top > bottom || left > right {
                break
            }

            //! 右下到左下
            index = right
            while index >= left {
                res.append(matrix[bottom][index])
                index -= 1
            }

            bottom -= 1

            //! 左下 到 左上
            index = bottom
            while index >= top {
                res.append(matrix[index][left])
                index -= 1
            }
            left += 1
        }
        return res
    }

    /// 依赖用例
    func spiralArray(x: Int, y: Int) -> [[Int]] {
        var rows = [[Int]]()
        for i in 0..<y {
            var cols = [Int]()
            for j in 1...x {
                let val = i * x + j
                cols.append(val)
            }
            rows.append(cols)
        }
        return rows
    }

    // MARK: 713. 乘积小于 K 的子数组
//    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
////        var result = 0
////        for i in 0..<nums.count {
////            var val = 1
////            for j in (i + 1)..<nums.count {
////                if val * nums[j] >= k {
////                    continue
////                } else {
////                    val = val * nums[j]
////                    result = result + 1
////                }
////            }
////        }
////        return result
////        var ret = 0
////        var i = 0
////        var val = 1
////        for j in 0..<nums.count {
////            val *= nums[j]
////            while i <= j && val >= k {
////                val /= nums[i]
////                i += 1
////            }
////            ret
////        }
//
//
//    }

    ///# 868. 二进制间距
    func binaryGap(_ n: Int) -> Int {
        let str = String(n, radix: 2)
        guard str.filter({ $0 == "1" }).count > 1 else { return 0 }
        var val = 0
        var idx = 0
        for (offset, element) in str.enumerated() where element == "1" {
            let tmp = offset - idx
            val = tmp > val ? tmp: val
            idx = offset
        }
        return val
    }


    ///# 剑指 Offer 12. 矩阵中的路径
    ///             //输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"

//    func exist(_ board: [[Character]], _ word: String) -> Bool {
//        //word.enumerated().map({ $0 })
//        let words = word.map({ Character("\($0)") })
////        var index = 0
////        var map = [(Int, Int)]()
////        while index < words.count {
////            let ch = words[index]
////            for i in 0..<board.count {
////                let bcols = board[i]
////                var isFind = false
////                for j in 0..<bcols.count {
////                    let target = bcols[j]
////                    if target == ch && !map.contains(where: { $0.0 == j && $0.1 == i }) {
////                        print("\(target) => \((j, i))")
////                        map.append((j, i))
////                        isFind = true
////                        break
////                    }
////                }
////                if isFind { break }
////            }
////            index += 1
////        }
//
//        let ch = Array(word)
//        guard let first = words.first, board.flatMap({ $0 }).contains(first) else { return false }
//        var x = 0
//        var y = 0
//        var index = 0
//        return true
//    }

    // MARK: 883. 三维形体投影面积
    // [[1,2],[3,4]]  17
    func projectionArea(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let f = grid.flatMap({ $0 }).filter({ $0 > 0 }).count
        var z = 0
        for i in 0..<n {
            var maxVal = 0
            for j in 0..<n {
                maxVal = max(maxVal, grid[i][j])
            }
            z += maxVal
        }
        var c = 0
        for i in 0..<n {
            var maxVal = 0
            for j in 0..<n {
                maxVal = max(maxVal, grid[j][i])
            }
            c += maxVal
        }
        return f + z + c
    }

    func hammingWeight(_ n: Int) -> Int {
        return String(n, radix: 2).filter({ $0 == "1" }).count
    }

    // MARK: 905. 按奇偶排序数组
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        //return nums.sorted(by: { $0 % 2 == 0 && $1 % 2 != 0 })

        //
//        var sorts1 = [Int]()
//        var sorts2 = [Int]()
//        for val in nums {
//            if val % 2 == 0 {
//                sorts1.append(val)
//            } else {
//                sorts2.append(val)
//            }
//        }
//        sorts1.append(contentsOf: sorts2)
//        return sorts1

        var arrs = nums
        var left = 0
        var right = arrs.count - 1
        while left <= right {
            if arrs[right] % 2 == 0 {
                let tmp = arrs[left]
                arrs[left] = arrs[right]
                arrs[right] = tmp
                left += 1
            } else {
                right -= 1
            }
        }
        return arrs
    }

    // MARK: 912. 排序数组
    func sortArray(_ nums: [Int]) -> [Int] {
        let count = nums.count
        guard count > 1 else { return nums }
        // 冒泡
        var array = nums
        for i in 0..<count {
            for j in (i + 1)..<count {
                if array[i] > array[j] {
                    //array.swapAt(i, j)
                    let tmp = array[i]
                    array[i] = array[j]
                    array[j] = tmp
                }
            }
        }
        return array
    }
}
