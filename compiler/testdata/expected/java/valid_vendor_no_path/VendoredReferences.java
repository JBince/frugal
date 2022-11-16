/**
 * Autogenerated by Frugal Compiler (3.16.8)
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *
 * @generated
 */
package include_vendor_no_path.java;

import org.apache.thrift.scheme.IScheme;
import org.apache.thrift.scheme.SchemeFactory;
import org.apache.thrift.scheme.StandardScheme;

import org.apache.thrift.scheme.TupleScheme;
import org.apache.thrift.protocol.TTupleProtocol;
import org.apache.thrift.protocol.TProtocolException;
import org.apache.thrift.EncodingUtils;
import org.apache.thrift.TException;
import org.apache.thrift.async.AsyncMethodCallback;
import org.apache.thrift.server.AbstractNonblockingServer.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.EnumMap;
import java.util.Set;
import java.util.HashSet;
import java.util.EnumSet;
import java.util.Collections;
import java.util.BitSet;
import java.util.Objects;
import java.nio.ByteBuffer;
import java.util.Arrays;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class VendoredReferences implements org.apache.thrift.TBase<VendoredReferences, VendoredReferences._Fields>, java.io.Serializable, Cloneable, Comparable<VendoredReferences> {
	private static final org.apache.thrift.protocol.TStruct STRUCT_DESC = new org.apache.thrift.protocol.TStruct("VendoredReferences");

	private static final org.apache.thrift.protocol.TField REFERENCE_VENDORED_CONST_FIELD_DESC = new org.apache.thrift.protocol.TField("reference_vendored_const", org.apache.thrift.protocol.TType.I32, (short)1);
	private static final org.apache.thrift.protocol.TField REFERENCE_VENDORED_ENUM_FIELD_DESC = new org.apache.thrift.protocol.TField("reference_vendored_enum", org.apache.thrift.protocol.TType.I32, (short)2);

	public int reference_vendored_const; // optional
	public vendor_namespace.java.MyEnum reference_vendored_enum; // optional
	/** The set of fields this struct contains, along with convenience methods for finding and manipulating them. */
	public enum _Fields implements org.apache.thrift.TFieldIdEnum {
		REFERENCE_VENDORED_CONST((short)1, "reference_vendored_const"),
		REFERENCE_VENDORED_ENUM((short)2, "reference_vendored_enum")
		;

		private static final Map<String, _Fields> byName = new HashMap<String, _Fields>();

		static {
			for (_Fields field : EnumSet.allOf(_Fields.class)) {
				byName.put(field.getFieldName(), field);
			}
		}

		/**
		 * Find the _Fields constant that matches fieldId, or null if its not found.
		 */
		public static _Fields findByThriftId(int fieldId) {
			switch(fieldId) {
				case 1: // REFERENCE_VENDORED_CONST
					return REFERENCE_VENDORED_CONST;
				case 2: // REFERENCE_VENDORED_ENUM
					return REFERENCE_VENDORED_ENUM;
				default:
					return null;
			}
		}

		/**
		 * Find the _Fields constant that matches fieldId, throwing an exception
		 * if it is not found.
		 */
		public static _Fields findByThriftIdOrThrow(int fieldId) {
			_Fields fields = findByThriftId(fieldId);
			if (fields == null) throw new IllegalArgumentException("Field " + fieldId + " doesn't exist!");
			return fields;
		}

		/**
		 * Find the _Fields constant that matches name, or null if its not found.
		 */
		public static _Fields findByName(String name) {
			return byName.get(name);
		}

		private final short _thriftId;
		private final String _fieldName;

		_Fields(short thriftId, String fieldName) {
			_thriftId = thriftId;
			_fieldName = fieldName;
		}

		public short getThriftFieldId() {
			return _thriftId;
		}

		public String getFieldName() {
			return _fieldName;
		}
	}

	// isset id assignments
	private static final int __REFERENCE_VENDORED_CONST_ISSET_ID = 0;
	private byte __isset_bitfield = 0;
	public VendoredReferences() {
		this.reference_vendored_const = vendor_namespace.java.vendor_namespace_no_pathConstants.a_const;

		this.reference_vendored_enum = vendor_namespace.java.MyEnum.TWO;

	}

	/**
	 * Performs a deep copy on <i>other</i>.
	 */
	public VendoredReferences(VendoredReferences other) {
		__isset_bitfield = other.__isset_bitfield;
		this.reference_vendored_const = other.reference_vendored_const;
		if (other.isSetReference_vendored_enum()) {
			this.reference_vendored_enum = other.reference_vendored_enum;
		}
	}

	public VendoredReferences deepCopy() {
		return new VendoredReferences(this);
	}

	@Override
	public void clear() {
		this.reference_vendored_const = vendor_namespace.java.vendor_namespace_no_pathConstants.a_const;

		this.reference_vendored_enum = vendor_namespace.java.MyEnum.TWO;

	}

	public int getReference_vendored_const() {
		return this.reference_vendored_const;
	}

	public VendoredReferences setReference_vendored_const(int reference_vendored_const) {
		this.reference_vendored_const = reference_vendored_const;
		setReference_vendored_constIsSet(true);
		return this;
	}

	public void unsetReference_vendored_const() {
		__isset_bitfield = EncodingUtils.clearBit(__isset_bitfield, __REFERENCE_VENDORED_CONST_ISSET_ID);
	}

	/** Returns true if field reference_vendored_const is set (has been assigned a value) and false otherwise */
	public boolean isSetReference_vendored_const() {
		return EncodingUtils.testBit(__isset_bitfield, __REFERENCE_VENDORED_CONST_ISSET_ID);
	}

	public void setReference_vendored_constIsSet(boolean value) {
		__isset_bitfield = EncodingUtils.setBit(__isset_bitfield, __REFERENCE_VENDORED_CONST_ISSET_ID, value);
	}

	public vendor_namespace.java.MyEnum getReference_vendored_enum() {
		return this.reference_vendored_enum;
	}

	public VendoredReferences setReference_vendored_enum(vendor_namespace.java.MyEnum reference_vendored_enum) {
		this.reference_vendored_enum = reference_vendored_enum;
		return this;
	}

	public void unsetReference_vendored_enum() {
		this.reference_vendored_enum = null;
	}

	/** Returns true if field reference_vendored_enum is set (has been assigned a value) and false otherwise */
	public boolean isSetReference_vendored_enum() {
		return this.reference_vendored_enum != null;
	}

	public void setReference_vendored_enumIsSet(boolean value) {
		if (!value) {
			this.reference_vendored_enum = null;
		}
	}

	public void setFieldValue(_Fields field, Object value) {
		switch (field) {
		case REFERENCE_VENDORED_CONST:
			if (value == null) {
				unsetReference_vendored_const();
			} else {
				setReference_vendored_const((Integer)value);
			}
			break;

		case REFERENCE_VENDORED_ENUM:
			if (value == null) {
				unsetReference_vendored_enum();
			} else {
				setReference_vendored_enum((vendor_namespace.java.MyEnum)value);
			}
			break;

		}
	}

	public Object getFieldValue(_Fields field) {
		switch (field) {
		case REFERENCE_VENDORED_CONST:
			return getReference_vendored_const();

		case REFERENCE_VENDORED_ENUM:
			return getReference_vendored_enum();

		}
		throw new IllegalStateException();
	}

	/** Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise */
	public boolean isSet(_Fields field) {
		if (field == null) {
			throw new IllegalArgumentException();
		}

		switch (field) {
		case REFERENCE_VENDORED_CONST:
			return isSetReference_vendored_const();
		case REFERENCE_VENDORED_ENUM:
			return isSetReference_vendored_enum();
		}
		throw new IllegalStateException();
	}

	@Override
	public boolean equals(Object that) {
		if (that == null)
			return false;
		if (that instanceof VendoredReferences)
			return this.equals((VendoredReferences)that);
		return false;
	}

	public boolean equals(VendoredReferences that) {
		if (that == null)
			return false;
		if (this.isSetReference_vendored_const() != that.isSetReference_vendored_const() || this.reference_vendored_const != that.reference_vendored_const)
			return false;
		if (!Objects.equals(this.reference_vendored_enum, that.reference_vendored_enum))
			return false;
		return true;
	}

	@Override
	public int hashCode() {
		List<Object> list = new ArrayList<Object>();

		boolean present_reference_vendored_const = true && (isSetReference_vendored_const());
		list.add(present_reference_vendored_const);
		if (present_reference_vendored_const)
			list.add(reference_vendored_const);

		boolean present_reference_vendored_enum = true && (isSetReference_vendored_enum());
		list.add(present_reference_vendored_enum);
		if (present_reference_vendored_enum)
			list.add(reference_vendored_enum.getValue());

		return list.hashCode();
	}

	@Override
	public int compareTo(VendoredReferences other) {
		if (!getClass().equals(other.getClass())) {
			return getClass().getName().compareTo(other.getClass().getName());
		}

		int lastComparison = 0;

		lastComparison = Boolean.compare(isSetReference_vendored_const(), other.isSetReference_vendored_const());
		if (lastComparison != 0) {
			return lastComparison;
		}
		if (isSetReference_vendored_const()) {
			lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.reference_vendored_const, other.reference_vendored_const);
			if (lastComparison != 0) {
				return lastComparison;
			}
		}
		lastComparison = Boolean.compare(isSetReference_vendored_enum(), other.isSetReference_vendored_enum());
		if (lastComparison != 0) {
			return lastComparison;
		}
		if (isSetReference_vendored_enum()) {
			lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.reference_vendored_enum, other.reference_vendored_enum);
			if (lastComparison != 0) {
				return lastComparison;
			}
		}
		return 0;
	}

	public _Fields fieldForId(int fieldId) {
		return _Fields.findByThriftId(fieldId);
	}

	public void read(org.apache.thrift.protocol.TProtocol iprot) throws org.apache.thrift.TException {
		if (iprot.getScheme() != StandardScheme.class) {
			throw new UnsupportedOperationException();
		}
		new VendoredReferencesStandardScheme().read(iprot, this);
	}

	public void write(org.apache.thrift.protocol.TProtocol oprot) throws org.apache.thrift.TException {
		if (oprot.getScheme() != StandardScheme.class) {
			throw new UnsupportedOperationException();
		}
		new VendoredReferencesStandardScheme().write(oprot, this);
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder("VendoredReferences(");
		boolean first = true;

		if (isSetReference_vendored_const()) {
			sb.append("reference_vendored_const:");
			sb.append(this.reference_vendored_const);
			first = false;
		}
		if (isSetReference_vendored_enum()) {
			if (!first) sb.append(", ");
			sb.append("reference_vendored_enum:");
			sb.append(this.reference_vendored_enum);
			first = false;
		}
		sb.append(")");
		return sb.toString();
	}

	public void validate() throws org.apache.thrift.TException {
		// check for required fields
		// check for sub-struct validity
	}

	private void writeObject(java.io.ObjectOutputStream out) throws java.io.IOException {
		try {
			write(new org.apache.thrift.protocol.TCompactProtocol(new org.apache.thrift.transport.TIOStreamTransport(out)));
		} catch (org.apache.thrift.TException te) {
			throw new java.io.IOException(te);
		}
	}

	private void readObject(java.io.ObjectInputStream in) throws java.io.IOException, ClassNotFoundException {
		try {
			// it doesn't seem like you should have to do this, but java serialization is wacky, and doesn't call the default constructor.
			__isset_bitfield = 0;
			read(new org.apache.thrift.protocol.TCompactProtocol(new org.apache.thrift.transport.TIOStreamTransport(in)));
		} catch (org.apache.thrift.TException te) {
			throw new java.io.IOException(te);
		}
	}

	private static class VendoredReferencesStandardScheme extends StandardScheme<VendoredReferences> {

		public void read(org.apache.thrift.protocol.TProtocol iprot, VendoredReferences struct) throws org.apache.thrift.TException {
			org.apache.thrift.protocol.TField schemeField;
			iprot.readStructBegin();
			while (true) {
				schemeField = iprot.readFieldBegin();
				if (schemeField.type == org.apache.thrift.protocol.TType.STOP) {
					break;
				}
				switch (schemeField.id) {
					case 1: // REFERENCE_VENDORED_CONST
						if (schemeField.type == org.apache.thrift.protocol.TType.I32) {
							struct.reference_vendored_const = iprot.readI32();
							struct.setReference_vendored_constIsSet(true);
						} else {
							org.apache.thrift.protocol.TProtocolUtil.skip(iprot, schemeField.type);
						}
						break;
					case 2: // REFERENCE_VENDORED_ENUM
						if (schemeField.type == org.apache.thrift.protocol.TType.I32) {
							struct.reference_vendored_enum = vendor_namespace.java.MyEnum.findByValue(iprot.readI32());
							struct.setReference_vendored_enumIsSet(true);
						} else {
							org.apache.thrift.protocol.TProtocolUtil.skip(iprot, schemeField.type);
						}
						break;
					default:
						org.apache.thrift.protocol.TProtocolUtil.skip(iprot, schemeField.type);
				}
				iprot.readFieldEnd();
			}
			iprot.readStructEnd();

			// check for required fields of primitive type, which can't be checked in the validate method
			struct.validate();
		}

		public void write(org.apache.thrift.protocol.TProtocol oprot, VendoredReferences struct) throws org.apache.thrift.TException {
			struct.validate();

			oprot.writeStructBegin(STRUCT_DESC);
			if (struct.isSetReference_vendored_const()) {
				oprot.writeFieldBegin(REFERENCE_VENDORED_CONST_FIELD_DESC);
				int elem0 = struct.reference_vendored_const;
				oprot.writeI32(elem0);
				oprot.writeFieldEnd();
			}
			if (struct.isSetReference_vendored_enum()) {
				oprot.writeFieldBegin(REFERENCE_VENDORED_ENUM_FIELD_DESC);
				vendor_namespace.java.MyEnum elem1 = struct.reference_vendored_enum;
				oprot.writeI32(elem1.getValue());
				oprot.writeFieldEnd();
			}
			oprot.writeFieldStop();
			oprot.writeStructEnd();
		}

	}

}
