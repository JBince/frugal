/**
 * Autogenerated by Frugal Compiler (3.4.6)
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *
 * @generated
 */
package actual_base.java;

import java.util.Map;
import java.util.HashMap;
import org.apache.thrift.TEnum;

public enum base_health_condition implements org.apache.thrift.TEnum {
	PASS(1),
	WARN(2),
	FAIL(3),
	UNKNOWN(4);

	private final int value;

	private base_health_condition(int value) {
		this.value = value;
	}

	public int getValue() {
		return value;
	}

	public static base_health_condition findByValue(int value) {
		switch (value) {
			case 1:
				return PASS;
			case 2:
				return WARN;
			case 3:
				return FAIL;
			case 4:
				return UNKNOWN;
			default:
				return null;
		}
	}
}
