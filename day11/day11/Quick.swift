//
//  Quick.swift
//  day11
//
//  Created by Monkey-Sun on 2019/3/20.
//  Copyright © 2019 XLang. All rights reserved.
//

import Foundation
let cutoff = 3;   //cutoff 5~20最好

class Quick: NSObject {
//    static func sort(_ array:inout [Int]) -> Void {
//        var low:Optional = 0;
//        var high:Optional = array.count - 1;
//        quickSort(&array, &low!, &high!);
//    }
////    快排之所以快，是因为采用了分治思想，分而治之，其实也是局部有序到整体有序的过程。类似ShellSort，只是ShellSort的效率取决于increment的集合。
////    快速排序的核心思路，正如代码所示；
////    1,设定一个pivot一般以数组z的第一个y元素为准
//    //    2,用low和high来分别遍历数组; 如果 pivot > array[low]，low停止移动;如果array[high] < pivot,high停止移动；交换low， high的值，继续递归这个过程，当 low > high直接return;如果low == high , 则将 array[low] 与 pivot 交换，交换后的pivot是定序的， 并以low为分割点，分割数组，分别递归排序。注意low和high的迭代。
//    static func quickSort( _ array:inout [Int], _ low:inout Int, _ high:inout Int) -> Void {
//        if low > high{
//            return;
//        }
//
//        var piovt = array[(low + high) / 2];
//        let poivtIndex = low;
//
//        while array[low] < piovt{
//            low += 1;
//        }
//
//        while array[high] > piovt{
//            high -= 1;
//        }
//
//        if low == high {
//            let temp = array[low];
//            array[low] = piovt;
//            piovt = temp;//交换poivt 与 array[low]的值
//            //分割数组，分别排序
//            var newL:Optional = low + 1;
//            var newR:Optional = array.count - 1;
//            quickSort(&array, &newL!, &newR!);
//
//            var lowL:Optional = poivtIndex + 1;
//            var lowR:Optional = low - 1;
//            quickSort(&array, &lowL!, &lowR!);
//        }else{
//            // 交换 array[low] 与 array[high]的值，继续遍历
//            let temp = array[low];
//            array[low] = array[high];
//            array[high] = temp;
//            quickSort(&array, &low, &high);
//        }
//    }
    
    // 3数中值分割法
    static func sort(_ array:inout [Int]) -> Void {
        quickSort(&array, 0, array.count - 1);
    }
    
    static func quickSort( _ array:inout [Int], _ low:Int, _ high:Int) -> Void {
        var i = 0;
        var j = 0;
        
        if low + cutoff <= high {
            let pivot = median3(&array, low, high);
            i = low;
            j = high - 1;
            
            while 1 > 0{
                while array[i] < pivot{
                    i += 1;
                }
                while array[j] > pivot{
                    j -= 1;
                }
                
                if i < j{
                    array.swapAt(i, j)
                }else{
                    break;
                }
            }
            
            array.swapAt(i, high - 1);
            
            let leftH = i - 1;
            let rightL = i + 1;
            
            quickSort(&array, low, leftH);
            quickSort(&array, rightL, high);
        }else{
            
            inserctionsort(&array, high - low + 1);
        }
    }
    
    //    array[left] 和 arrary[center] 、 array[right] ,三者中最小的放左边，最大的放数组右边 ， pivot 选择在 high - 1 处
    static func median3(_ array:inout [Int], _ low:Int, _ high:Int) -> Int {
        let center = (low + high) / 2;
        
        if array[low] > array[center] {
            array.swapAt(low, center);
        }
        
        if array[low] > array[high]{
            array.swapAt(low, high);
        }
        
        if array[center] > array[high] {
            array.swapAt(center, high);
        }
        
        array.swapAt(center, high - 1);
        
        return array[high - 1];
    }
    
    static func inserctionsort(_ array:inout [Int], _ n:Int) -> Void {
        for p in 1..<n {
            var j = p;
            let temp = array[p];
            while j > 0 && array[j - 1] > temp{ // 依次比较j-1至0所在元素的值与temp的值的大小; 正序或逆序 取决于这里是将较小的往前插还是较大的往前插
                array[j] = array[j - 1]; // 将元素向右移，腾出位置j给temp
                j -= 1;
            }
            array[j] = temp;// 将temp赋值到正确的位置j
        }
    }
}
