package com.ifeng.util;

import java.util.Random;

public class RandCodeUtils {

	/**
	 * 计算随机数
	 * @return
	 */
	public static String caculateSeq(long timestamp){
		int[] array = {0,1,2,3,4,5,6,7,8,9};
		Random rand = new Random();
		for (int i = 10; i > 1; i--) {
			int index = rand.nextInt(i);
			int tmp = array[index];
			array[index] = array[i - 1];
			array[i - 1] = tmp;
		}
		int result = 0;
		for(int i = 0; i < 8; i++)
			result = result * 10 + array[i];
		return timestamp+""+result;
	}
}
