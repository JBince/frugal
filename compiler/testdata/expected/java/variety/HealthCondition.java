/**
 * Autogenerated by Frugal Compiler (3.16.10)
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *
 * @generated
 */
package variety.java;

import java.util.Map;
import java.util.HashMap;
import org.apache.thrift.TEnum;

public enum HealthCondition implements org.apache.thrift.TEnum {
	/**
	 * This docstring gets added to the generated code because it
	 * has the @ sign.
	 */
	PASS(1),
	/**
	 * This docstring also gets added to the generated code
	 * because it has the @ sign.
	 */
	WARN(2),
	/**
	 * @deprecated use something else
	 */
	@Deprecated
	FAIL(3),
	/**
	 * This is a docstring comment for a deprecated enum value that has been
	 * spread across two lines.
	 * @deprecated don't use this; use "something else"
	 */
	@Deprecated
	UNKNOWN(4);

	private final int value;

	private HealthCondition(int value) {
		this.value = value;
	}

	public int getValue() {
		return value;
	}

	public static HealthCondition findByValue(int value) {
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
