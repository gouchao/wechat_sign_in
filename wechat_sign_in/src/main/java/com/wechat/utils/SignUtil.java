package com.wechat.utils;

import java.security.MessageDigest;
import java.util.Arrays;

public class SignUtil {
	private static String token="weixinmeng";
	
	 /** 
    * 验证签名 
    *  
    * @param signature 
    * @param timestamp 
    * @param nonce 
    * @return 
    */  
   public static boolean checkSignature(String signature, String timestamp, String nonce) {  
       String[] arr = new String[]{token,timestamp,nonce};  
       // 将token、timestamp、nonce三个参数进行字典序排序  
       Arrays.sort(arr);  
       StringBuilder content = new StringBuilder();  
       for (int i = 0; i < arr.length; i++) {  
           content.append(arr[i]);  
       }  
       String temp = gethxDigit(content.toString());
       return temp.equals(signature);
   } 
   
   public static String  gethxDigit(String str){
   	if(str==null||str.length()==0){
   		return null;
   	}
   	char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
   	try{
   		MessageDigest mdTemp = MessageDigest.getInstance("SHA1");
   		mdTemp.update(str.getBytes("UTF-8"));
   		
   		byte[] md=mdTemp.digest();
   		int j = md.length;
   		char buf[] = new char[j*2];
   		int k =0;
   		for(int i=0;i<j;i++){
   			byte byte0=md[i];
   			buf[k++] = hexDigits[byte0>>>4&0xf];
   			buf[k++] = hexDigits[byte0&0xf];
   		}
   		return new String(buf);
   	}catch(Exception e){
   		return null;
   	}
   }
}
