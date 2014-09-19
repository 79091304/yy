package com.ifeng.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import com.ifeng.entity.User;


/**
 * 生成帐户激活、重新设置密码的链接
 */
public class GenerateLinkUtils {
	
	private static final String CHECK_CODE = "checkcode";
	
	/**
	 * 生成帐户激活链接
	 */
	public static String generateActivateLink(User user) {
		return "www.lanrenyuan.com/user/activateAccount.htm?uid=" 
				+ user.getId() + "&" + CHECK_CODE + "=" + generateCheckcode(user);
	}
	
	/**
	 * 生成重设密码的链接
	 */
	public static String generateResetPwdLink(User user) {
		return "www.lanrenyuan.com/user/resetPasswordUI.htm?username=" 
				+ user.getUsername() + "&" + CHECK_CODE + "=" + generateCheckcode(user);
	}
	
	/**
	 * 生成验证帐户的MD5校验码
	 * @param user  要激活的帐户
	 * @return 验证码，通过md5加密后的16进制格式的字符串
	 */
	public static String generateCheckcode(User user) {
		String code = user.getVerify();
		return MD5Sec.md5(code);
	}
	
	/**
	 * 验证校验码是否和注册时发送的验证码一致
	 * @param user 要激活的帐户
	 * @param checkcode 注册时发送的校验码
	 * @return 如果一致返回true，否则返回false
	 */
	public static boolean verifyCheckcode(User user,HttpServletRequest request) {
		String checkCode = (String)request.getSession().getAttribute(RandomValidateCode.RANDOMCODEKEY);
		return generateCheckcode(user).equals(checkCode);
	}

	
}