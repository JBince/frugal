/**
 * Autogenerated by Frugal Compiler (3.16.23)
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *
 * @generated
 */
package v1.music;

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
import javax.annotation.Generated;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The IDL provides set, list, and map types for representing collections
 * of data.  Our Album struct contains a list of Tracks.
 */
@Generated(value = "Autogenerated by Frugal Compiler (3.16.23)")
public class Album implements org.apache.thrift.TBase<Album, Album._Fields>, java.io.Serializable, Cloneable, Comparable<Album> {
	private static final org.apache.thrift.protocol.TStruct STRUCT_DESC = new org.apache.thrift.protocol.TStruct("Album");

	private static final org.apache.thrift.protocol.TField TRACKS_FIELD_DESC = new org.apache.thrift.protocol.TField("tracks", org.apache.thrift.protocol.TType.LIST, (short)1);
	private static final org.apache.thrift.protocol.TField DURATION_FIELD_DESC = new org.apache.thrift.protocol.TField("duration", org.apache.thrift.protocol.TType.DOUBLE, (short)2);
	private static final org.apache.thrift.protocol.TField ASIN_FIELD_DESC = new org.apache.thrift.protocol.TField("ASIN", org.apache.thrift.protocol.TType.STRING, (short)3);

	public java.util.List<Track> tracks;
	public double duration;
	public String ASIN;
	/** The set of fields this struct contains, along with convenience methods for finding and manipulating them. */
	public enum _Fields implements org.apache.thrift.TFieldIdEnum {
		TRACKS((short)1, "tracks"),
		DURATION((short)2, "duration"),
		ASIN((short)3, "ASIN")
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
				case 1: // TRACKS
					return TRACKS;
				case 2: // DURATION
					return DURATION;
				case 3: // ASIN
					return ASIN;
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
	private static final int __DURATION_ISSET_ID = 0;
	private byte __isset_bitfield = 0;
	public Album() {
	}

	public Album(
		java.util.List<Track> tracks,
		double duration,
		String ASIN) {
		this();
		this.tracks = tracks;
		this.duration = duration;
		setDurationIsSet(true);
		this.ASIN = ASIN;
	}

	/**
	 * Performs a deep copy on <i>other</i>.
	 */
	public Album(Album other) {
		__isset_bitfield = other.__isset_bitfield;
		if (other.isSetTracks()) {
			this.tracks = new ArrayList<Track>(other.tracks.size());
			for (Track elem6 : other.tracks) {
				Track elem7 = new Track(elem6);
				this.tracks.add(elem7);
			}
		}
		this.duration = other.duration;
		if (other.isSetASIN()) {
			this.ASIN = other.ASIN;
		}
	}

	public Album deepCopy() {
		return new Album(this);
	}

	@Override
	public void clear() {
		this.tracks = null;

		setDurationIsSet(false);
		this.duration = 0.0;

		this.ASIN = null;

	}

	public int getTracksSize() {
		return (this.tracks == null) ? 0 : this.tracks.size();
	}

	public java.util.Iterator<Track> getTracksIterator() {
		return (this.tracks == null) ? null : this.tracks.iterator();
	}

	public void addToTracks(Track elem) {
		if (this.tracks == null) {
			this.tracks = new ArrayList<Track>();
		}
		this.tracks.add(elem);
	}

	public java.util.List<Track> getTracks() {
		return this.tracks;
	}

	public Album setTracks(java.util.List<Track> tracks) {
		this.tracks = tracks;
		return this;
	}

	public void unsetTracks() {
		this.tracks = null;
	}

	/** Returns true if field tracks is set (has been assigned a value) and false otherwise */
	public boolean isSetTracks() {
		return this.tracks != null;
	}

	public void setTracksIsSet(boolean value) {
		if (!value) {
			this.tracks = null;
		}
	}

	public double getDuration() {
		return this.duration;
	}

	public Album setDuration(double duration) {
		this.duration = duration;
		setDurationIsSet(true);
		return this;
	}

	public void unsetDuration() {
		__isset_bitfield = EncodingUtils.clearBit(__isset_bitfield, __DURATION_ISSET_ID);
	}

	/** Returns true if field duration is set (has been assigned a value) and false otherwise */
	public boolean isSetDuration() {
		return EncodingUtils.testBit(__isset_bitfield, __DURATION_ISSET_ID);
	}

	public void setDurationIsSet(boolean value) {
		__isset_bitfield = EncodingUtils.setBit(__isset_bitfield, __DURATION_ISSET_ID, value);
	}

	public String getASIN() {
		return this.ASIN;
	}

	public Album setASIN(String ASIN) {
		this.ASIN = ASIN;
		return this;
	}

	public void unsetASIN() {
		this.ASIN = null;
	}

	/** Returns true if field ASIN is set (has been assigned a value) and false otherwise */
	public boolean isSetASIN() {
		return this.ASIN != null;
	}

	public void setASINIsSet(boolean value) {
		if (!value) {
			this.ASIN = null;
		}
	}

	public void setFieldValue(_Fields field, Object value) {
		switch (field) {
		case TRACKS:
			if (value == null) {
				unsetTracks();
			} else {
				setTracks((java.util.List<Track>)value);
			}
			break;

		case DURATION:
			if (value == null) {
				unsetDuration();
			} else {
				setDuration((Double)value);
			}
			break;

		case ASIN:
			if (value == null) {
				unsetASIN();
			} else {
				setASIN((String)value);
			}
			break;

		}
	}

	public Object getFieldValue(_Fields field) {
		switch (field) {
		case TRACKS:
			return getTracks();

		case DURATION:
			return getDuration();

		case ASIN:
			return getASIN();

		}
		throw new IllegalStateException();
	}

	/** Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise */
	public boolean isSet(_Fields field) {
		if (field == null) {
			throw new IllegalArgumentException();
		}

		switch (field) {
		case TRACKS:
			return isSetTracks();
		case DURATION:
			return isSetDuration();
		case ASIN:
			return isSetASIN();
		}
		throw new IllegalStateException();
	}

	@Override
	public boolean equals(Object that) {
		if (that == null)
			return false;
		if (that instanceof Album)
			return this.equals((Album)that);
		return false;
	}

	public boolean equals(Album that) {
		if (that == null)
			return false;
		if (!Objects.equals(this.tracks, that.tracks))
			return false;
		if (this.duration != that.duration)
			return false;
		if (!Objects.equals(this.ASIN, that.ASIN))
			return false;
		return true;
	}

	@Override
	public int hashCode() {
		List<Object> list = new ArrayList<Object>();

		boolean present_tracks = true && (isSetTracks());
		list.add(present_tracks);
		if (present_tracks)
			list.add(tracks);

		boolean present_duration = true;
		list.add(present_duration);
		if (present_duration)
			list.add(duration);

		boolean present_ASIN = true && (isSetASIN());
		list.add(present_ASIN);
		if (present_ASIN)
			list.add(ASIN);

		return list.hashCode();
	}

	@Override
	public int compareTo(Album other) {
		if (!getClass().equals(other.getClass())) {
			return getClass().getName().compareTo(other.getClass().getName());
		}

		int lastComparison = 0;

		lastComparison = Boolean.compare(isSetTracks(), other.isSetTracks());
		if (lastComparison != 0) {
			return lastComparison;
		}
		if (isSetTracks()) {
			lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.tracks, other.tracks);
			if (lastComparison != 0) {
				return lastComparison;
			}
		}
		lastComparison = Boolean.compare(isSetDuration(), other.isSetDuration());
		if (lastComparison != 0) {
			return lastComparison;
		}
		if (isSetDuration()) {
			lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.duration, other.duration);
			if (lastComparison != 0) {
				return lastComparison;
			}
		}
		lastComparison = Boolean.compare(isSetASIN(), other.isSetASIN());
		if (lastComparison != 0) {
			return lastComparison;
		}
		if (isSetASIN()) {
			lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.ASIN, other.ASIN);
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
		new AlbumStandardScheme().read(iprot, this);
	}

	public void write(org.apache.thrift.protocol.TProtocol oprot) throws org.apache.thrift.TException {
		if (oprot.getScheme() != StandardScheme.class) {
			throw new UnsupportedOperationException();
		}
		new AlbumStandardScheme().write(oprot, this);
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder("Album(");
		boolean first = true;

		sb.append("tracks:");
		sb.append(this.tracks);
		first = false;
		if (!first) sb.append(", ");
		sb.append("duration:");
		sb.append(this.duration);
		first = false;
		if (!first) sb.append(", ");
		sb.append("ASIN:");
		sb.append(this.ASIN);
		first = false;
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

	private static class AlbumStandardScheme extends StandardScheme<Album> {

		public void read(org.apache.thrift.protocol.TProtocol iprot, Album struct) throws org.apache.thrift.TException {
			org.apache.thrift.protocol.TField schemeField;
			iprot.readStructBegin();
			while (true) {
				schemeField = iprot.readFieldBegin();
				if (schemeField.type == org.apache.thrift.protocol.TType.STOP) {
					break;
				}
				switch (schemeField.id) {
					case 1: // TRACKS
						if (schemeField.type == org.apache.thrift.protocol.TType.LIST) {
							org.apache.thrift.protocol.TList elem8 = iprot.readListBegin();
							struct.tracks = new ArrayList<Track>(elem8.size);
							for (int elem9 = 0; elem9 < elem8.size; ++elem9) {
								Track elem10 = new Track();
								elem10.read(iprot);
								struct.tracks.add(elem10);
							}
							iprot.readListEnd();
							struct.setTracksIsSet(true);
						} else {
							org.apache.thrift.protocol.TProtocolUtil.skip(iprot, schemeField.type);
						}
						break;
					case 2: // DURATION
						if (schemeField.type == org.apache.thrift.protocol.TType.DOUBLE) {
							struct.duration = iprot.readDouble();
							struct.setDurationIsSet(true);
						} else {
							org.apache.thrift.protocol.TProtocolUtil.skip(iprot, schemeField.type);
						}
						break;
					case 3: // ASIN
						if (schemeField.type == org.apache.thrift.protocol.TType.STRING) {
							struct.ASIN = iprot.readString();
							struct.setASINIsSet(true);
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

		public void write(org.apache.thrift.protocol.TProtocol oprot, Album struct) throws org.apache.thrift.TException {
			struct.validate();

			oprot.writeStructBegin(STRUCT_DESC);
			if (struct.isSetTracks()) {
				oprot.writeFieldBegin(TRACKS_FIELD_DESC);
				oprot.writeListBegin(new org.apache.thrift.protocol.TList(org.apache.thrift.protocol.TType.STRUCT, struct.tracks.size()));
				for (Track elem11 : struct.tracks) {
					elem11.write(oprot);
				}
				oprot.writeListEnd();
				oprot.writeFieldEnd();
			}
			oprot.writeFieldBegin(DURATION_FIELD_DESC);
			double elem12 = struct.duration;
			oprot.writeDouble(elem12);
			oprot.writeFieldEnd();
			if (struct.isSetASIN()) {
				oprot.writeFieldBegin(ASIN_FIELD_DESC);
				String elem13 = struct.ASIN;
				oprot.writeString(elem13);
				oprot.writeFieldEnd();
			}
			oprot.writeFieldStop();
			oprot.writeStructEnd();
		}

	}

}
