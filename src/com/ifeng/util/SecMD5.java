package com.ifeng.util;
import java.security.*;
public class SecMD5 {      
 public static String MD5(String s) {      
  char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',      
    'a', 'b', 'c', 'd', 'e', 'f' };      
  try {      
   byte[] strTemp = s.getBytes();      
   MessageDigest mdTemp = MessageDigest.getInstance("MD5");      
   mdTemp.update(strTemp);      
   byte[] md = mdTemp.digest();      
   int j = md.length;      
   char str[] = new char[j * 2];      
   int k = 0;      
   for (int i = 0; i < j; i++) {      
    byte byte0 = md[i];      
    str[k++] = hexDigits[byte0 >>> 4 & 0xf];
    str[k++] = hexDigits[byte0 & 0xf];      
   }      
   return new String(str);      
  } catch (Exception e) {      
   return null;
  }
 }
 public static String getMD5(byte[] source) {
		String s = null;
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f' };// 鐢ㄦ潵灏嗗瓧鑺傝浆鎹㈡垚16杩涘埗琛ㄧず鐨勫瓧绗�
		try {
			java.security.MessageDigest md = java.security.MessageDigest
					.getInstance("MD5");
			md.update(source);
			byte tmp[] = md.digest();// MD5 鐨勮绠楃粨鏋滄槸涓�釜 128 浣嶇殑闀挎暣鏁帮紝
			// 鐢ㄥ瓧鑺傝〃绀哄氨鏄�16 涓瓧鑺�
			char str[] = new char[16 * 2];// 姣忎釜瀛楄妭鐢�16 杩涘埗琛ㄧず鐨勮瘽锛屼娇鐢ㄤ袱涓瓧绗︼紝 鎵�互琛ㄧず鎴�16
			// 杩涘埗闇� 32 涓瓧绗�
			int k = 0;// 琛ㄧず杞崲缁撴灉涓搴旂殑瀛楃浣嶇疆
			for (int i = 0; i < 16; i++) {// 浠庣涓�釜瀛楄妭寮�锛屽 MD5 鐨勬瘡涓�釜瀛楄妭// 杞崲鎴�16
				// 杩涘埗瀛楃鐨勮浆鎹�
				byte byte0 = tmp[i];// 鍙栫 i 涓瓧鑺�
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];// 鍙栧瓧鑺備腑楂�4 浣嶇殑鏁板瓧杞崲,// >>>
				// 涓洪�杈戝彸绉伙紝灏嗙鍙蜂綅涓�捣鍙崇Щ
				str[k++] = hexDigits[byte0 & 0xf];// 鍙栧瓧鑺備腑浣�4 浣嶇殑鏁板瓧杞崲

			}
			s = new String(str);// 鎹㈠悗鐨勭粨鏋滆浆鎹负瀛楃涓�

		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}
	/**
	 * MD5鍔犲瘑绫�
	 * @param str 瑕佸姞瀵嗙殑瀛楃涓�
	 * @return    鍔犲瘑鍚庣殑瀛楃涓�
	 */
	public static String toMD5(String str){
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte[]byteDigest = md.digest();
			int i;
			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < byteDigest.length; offset++) {
				i = byteDigest[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			//32浣嶅姞瀵�
			return buf.toString();
			// 16浣嶇殑鍔犲瘑
			//return buf.toString().substring(8, 24); 
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		
	}
 public static void main(String[] args) {      
  // MD5_Test aa = new MD5_Test();      
  System.out.print(SecMD5.MD5("123456"));      
 }      
} 
