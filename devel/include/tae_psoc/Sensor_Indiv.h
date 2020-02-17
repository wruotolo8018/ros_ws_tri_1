// Generated by gencpp from file tae_psoc/Sensor_Indiv.msg
// DO NOT EDIT!


#ifndef TAE_PSOC_MESSAGE_SENSOR_INDIV_H
#define TAE_PSOC_MESSAGE_SENSOR_INDIV_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace tae_psoc
{
template <class ContainerAllocator>
struct Sensor_Indiv_
{
  typedef Sensor_Indiv_<ContainerAllocator> Type;

  Sensor_Indiv_()
    : sns_1_Indiv()
    , sns_2_Indiv()
    , sns_3_Indiv()  {
    }
  Sensor_Indiv_(const ContainerAllocator& _alloc)
    : sns_1_Indiv(_alloc)
    , sns_2_Indiv(_alloc)
    , sns_3_Indiv(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<int16_t, typename ContainerAllocator::template rebind<int16_t>::other >  _sns_1_Indiv_type;
  _sns_1_Indiv_type sns_1_Indiv;

   typedef std::vector<int16_t, typename ContainerAllocator::template rebind<int16_t>::other >  _sns_2_Indiv_type;
  _sns_2_Indiv_type sns_2_Indiv;

   typedef std::vector<int16_t, typename ContainerAllocator::template rebind<int16_t>::other >  _sns_3_Indiv_type;
  _sns_3_Indiv_type sns_3_Indiv;





  typedef boost::shared_ptr< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> const> ConstPtr;

}; // struct Sensor_Indiv_

typedef ::tae_psoc::Sensor_Indiv_<std::allocator<void> > Sensor_Indiv;

typedef boost::shared_ptr< ::tae_psoc::Sensor_Indiv > Sensor_IndivPtr;
typedef boost::shared_ptr< ::tae_psoc::Sensor_Indiv const> Sensor_IndivConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tae_psoc::Sensor_Indiv_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace tae_psoc

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'tae_psoc': ['/home/wilson/ros_ws_1/src/tae_psoc/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b388094140ac5a2ba7cc9329470ad33d";
  }

  static const char* value(const ::tae_psoc::Sensor_Indiv_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb388094140ac5a2bULL;
  static const uint64_t static_value2 = 0xa7cc9329470ad33dULL;
};

template<class ContainerAllocator>
struct DataType< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tae_psoc/Sensor_Indiv";
  }

  static const char* value(const ::tae_psoc::Sensor_Indiv_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16[] sns_1_Indiv\n"
"int16[] sns_2_Indiv\n"
"int16[] sns_3_Indiv\n"
;
  }

  static const char* value(const ::tae_psoc::Sensor_Indiv_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.sns_1_Indiv);
      stream.next(m.sns_2_Indiv);
      stream.next(m.sns_3_Indiv);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Sensor_Indiv_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tae_psoc::Sensor_Indiv_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tae_psoc::Sensor_Indiv_<ContainerAllocator>& v)
  {
    s << indent << "sns_1_Indiv[]" << std::endl;
    for (size_t i = 0; i < v.sns_1_Indiv.size(); ++i)
    {
      s << indent << "  sns_1_Indiv[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.sns_1_Indiv[i]);
    }
    s << indent << "sns_2_Indiv[]" << std::endl;
    for (size_t i = 0; i < v.sns_2_Indiv.size(); ++i)
    {
      s << indent << "  sns_2_Indiv[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.sns_2_Indiv[i]);
    }
    s << indent << "sns_3_Indiv[]" << std::endl;
    for (size_t i = 0; i < v.sns_3_Indiv.size(); ++i)
    {
      s << indent << "  sns_3_Indiv[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.sns_3_Indiv[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // TAE_PSOC_MESSAGE_SENSOR_INDIV_H