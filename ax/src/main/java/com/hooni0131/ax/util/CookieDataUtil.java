package com.hooni0131.ax.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieDataUtil {

	/**
	 * Cookie Reset
	 * @param request
	 * @param response
	 */
	public void resetCookies(HttpServletRequest request, HttpServletResponse response) {
		
		Cookie[] cookies = request.getCookies();
		if( null != cookies) {
			for( Cookie cookie: cookies ) {
				
				cookie.setValue(cookie.getName());
				cookie.setMaxAge(-1);
				
				response.addCookie(cookie);
			}
		}
		
	}
}
