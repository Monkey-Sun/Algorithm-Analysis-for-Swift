//
//  main.swift
//  day9
//
//  Created by Monkey-Sun on 2019/3/11.
//  Copyright © 2019 XLang. All rights reserved.
//

import Foundation


//var PQ:Optional = PriorityQueue(100);
//
//
//for i in (0..<100).reversed(){
//    PQ!.insertWithoutSort(NumberKey(i));
//}
//
////堆排序
//PQ!.heapSort();
//
//for _ in 0..<100{
//    let obj = PriorityQueue.dequeue(&PQ!) as! NumberKey;
//    print(obj.key);
//}


//func bubbleSort(_ array:inout [Int]) -> Void {
//    for i in 0..<array.count{
//        for j in 0..<(array.count - i - 1){
//            if array[j] > array[j + 1]{
//                let temp = array[j];
//                array[j] = array[j + 1];
//                array[j + 1] = temp;
//            }
//        }
//    }
//}
//
//
//var array = [3,4,1,5,6,2];
//bubbleSort(&array);
//print(array);

// 银行排队时间
var event_queue:Optional = PriorityQueue(100000);
var customer_queue:Optional = PriorityQueue(10000);
let sevices = Array<ServiceWindow>();
var service_begin_t:Optional = 1000;//从1000 开始服务
let window_num = 5;
let service_end_t = 10000;//到10000 结束服务
func bankSevice()->Void{
    while !event_queue!.isEmpty {
        var current_event:Event = event_queue!.front as! Event;
        if current_event.occur_time >= service_end_t{
            //超出营业时间
            break;
        }
        if(!customer_queue!.isEmpty && event_queue!.size <= window_num)//生成新的顾客到达事件
        {
            generate_arrived_event(&service_begin_t!);
            current_event = event_queue!.front as! Event;//update current event, deal it with order
        }

        if current_event.event_type == EventType.arrive{
            //处理顾客到达事件
            customer_arrived();
        }
        else if current_event.event_type == EventType.departrue{
            //处理顾客离开事件
//            customer_departure();
        }
    }
}

//生成到达时间 生成单位时间内的顾客到达事件并入队，current_time是共享的
func generate_arrived_event(_ current_time:inout Int) -> Void {
    var customer_per_minute:Int = RandomManager.arriveCustomers();
    while (customer_per_minute > 0) {
        let event = Event(current_time);
        event_queue!.enqueue(event);
        customer_per_minute -= 1;
    }
    current_time += 1;
}

func generate_departure_event(_ service_index:Int, _ current_time:inout Int) -> Void {
    sevices[service_index].serve_customer(customer_queue!.front as! Customer);
    sevices[service_index].busy = true;//服务窗口置为“忙”
    sevices[service_index].set_service_start_time(current_time);//服务开始时间
    customer_queue = PriorityQueue.dequeue(&customer_queue!) as? PriorityQueue;

    let duration = sevices[service_index].get_customer_duration();
    let event = Event(current_time + duration, EventType.departrue, service_index);//生成顾客离开事件
    event_queue!.enqueue(event);
}


func customer_arrived() -> Void {
    let can_service_num = get_idle_service_index();//获取空闲的服务窗口，返回-1说明未找到
    let current_event:Event = event_queue!.front as! Event;
    var current_time:Optional = current_event.occur_time;
    let customer = Customer(current_time!);//顾客到达事件发生时间即为顾客到达时间， 顾客接受服务的时长随机
    customer_queue?.enqueue(customer);
    event_queue = PriorityQueue.dequeue(&event_queue!) as? PriorityQueue;
    if can_service_num != -1{
        generate_departure_event(can_service_num, &current_time!);
    }
}

func get_idle_service_index() -> Int {
    return 1;
}
