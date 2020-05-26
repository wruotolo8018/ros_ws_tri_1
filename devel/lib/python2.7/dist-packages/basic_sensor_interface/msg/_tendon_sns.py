# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from basic_sensor_interface/tendon_sns.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class tendon_sns(genpy.Message):
  _md5sum = "62e9a46c9ccdea164569c283a1055200"
  _type = "basic_sensor_interface/tendon_sns"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """uint32 prox1
uint32 dist1
uint32 hype1
uint32 prox2
uint32 dist2
uint32 hype2
uint32 prox3
uint32 dist3
uint32 hype3
"""
  __slots__ = ['prox1','dist1','hype1','prox2','dist2','hype2','prox3','dist3','hype3']
  _slot_types = ['uint32','uint32','uint32','uint32','uint32','uint32','uint32','uint32','uint32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       prox1,dist1,hype1,prox2,dist2,hype2,prox3,dist3,hype3

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(tendon_sns, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.prox1 is None:
        self.prox1 = 0
      if self.dist1 is None:
        self.dist1 = 0
      if self.hype1 is None:
        self.hype1 = 0
      if self.prox2 is None:
        self.prox2 = 0
      if self.dist2 is None:
        self.dist2 = 0
      if self.hype2 is None:
        self.hype2 = 0
      if self.prox3 is None:
        self.prox3 = 0
      if self.dist3 is None:
        self.dist3 = 0
      if self.hype3 is None:
        self.hype3 = 0
    else:
      self.prox1 = 0
      self.dist1 = 0
      self.hype1 = 0
      self.prox2 = 0
      self.dist2 = 0
      self.hype2 = 0
      self.prox3 = 0
      self.dist3 = 0
      self.hype3 = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_9I().pack(_x.prox1, _x.dist1, _x.hype1, _x.prox2, _x.dist2, _x.hype2, _x.prox3, _x.dist3, _x.hype3))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 36
      (_x.prox1, _x.dist1, _x.hype1, _x.prox2, _x.dist2, _x.hype2, _x.prox3, _x.dist3, _x.hype3,) = _get_struct_9I().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_9I().pack(_x.prox1, _x.dist1, _x.hype1, _x.prox2, _x.dist2, _x.hype2, _x.prox3, _x.dist3, _x.hype3))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 36
      (_x.prox1, _x.dist1, _x.hype1, _x.prox2, _x.dist2, _x.hype2, _x.prox3, _x.dist3, _x.hype3,) = _get_struct_9I().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_9I = None
def _get_struct_9I():
    global _struct_9I
    if _struct_9I is None:
        _struct_9I = struct.Struct("<9I")
    return _struct_9I
