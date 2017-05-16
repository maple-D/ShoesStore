package com.zhiguo.shoes.util;

/**
 * Created by Administrator on 2017/4/30/030.
 */
public class StringUtils {

    public static boolean nullOrEmpty(String str){
        if ("".equals(str) || null == str){
            return true;
        }
        return false;
    }
}
