package main

import (
	"fmt"
	"math/rand"
	"time"
)

func RandArray(num int) []int {
	arr := make([]int, num)
	//以当前时间为随机数种子
	rand.Seed(time.Now().Unix())

	for i := 0; i < num; i++ {
		arr[i] = rand.Intn(100)

	}
	return arr

}

func quic_wiki(data []int) []int {
	if len(data) <= 1 {
		return data
	}
	mid := data[0]
	head, tail := 0, len(data)-1
	for i := 1; i <= tail; {
		if data[i] > mid {
			data[i], data[tail] = data[tail], data[i]
			tail--
		} else {
			data[i], data[head] = data[head], data[i]
			head++
			i++
		}
	}
	data[head] = mid
	quic_wiki(data[:head])
	quic_wiki(data[head+1:])
	return data

}

func quick_sort(arr []int) []int {

	if len(arr) <= 1 {
		return arr
	}

	median := arr[rand.Intn(len(arr))]
	//fmt.Printf("par: %v\n", median)

	low_part := make([]int, 0, len(arr))
	high_part := make([]int, 0, len(arr))
	middle_part := make([]int, 0, len(arr))

	for _, item := range arr {
		switch {
		case item < median:
			low_part = append(low_part, item)
		case item == median:
			middle_part = append(middle_part, item)
		case item > median:
			high_part = append(high_part, item)
		}
	}

	low_part = quick_sort(low_part)
	high_part = quick_sort(high_part)

	low_part = append(low_part, middle_part...)
	low_part = append(low_part, high_part...)

	return low_part
}
func main() {
	fmt.Println("Quick sort algorithm \n")
	arr := RandArray(13)
	fmt.Println("Initial array is:", arr)
	fmt.Println("")
	fmt.Println(" wiki  Sorted  array is: ", quic_wiki(arr))

	fmt.Println("")
	fmt.Println(" others Sorted array is: ", quick_sort(arr))

}
