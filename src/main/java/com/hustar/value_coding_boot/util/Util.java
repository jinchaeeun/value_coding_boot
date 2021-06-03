package com.hustar.value_coding_boot.util;

import java.math.BigInteger;

public class Util {
	
	public static int getAsInt(Object object) {
		return getAsInt(object, -1);
	}

	public static int getAsInt(Object object, int defaultValue) {
		if (object instanceof BigInteger ) {
			return ((BigInteger)object).intValue();
		}
		if (object instanceof String ) {
			return Integer.parseInt((String) object);
		}
		if (object instanceof Long ) {
			return (int)((long)object);
		}
		
		if (object instanceof Integer ) {
			return (int)object;
		}
		
		return defaultValue;
	}
	
	
	public static String getAsStr(Object object, String defaultValue) {
		if (object == null ) {
			return defaultValue;
		}
		
		// String일 경우
		if (object instanceof String ) {
			return (String) (object);
		} // String이 아닐 경우 string으로 변환
		return object.toString();
	}

}
