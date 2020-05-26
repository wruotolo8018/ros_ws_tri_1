// Generated by gencpp from file basic_sensor_interface/tendon_sns.msg
// DO NOT EDIT!


#ifndef BASIC_SENSOR_INTERFACE_MESSAGE_TENDON_SNS_H
#define BASIC_SENSOR_INTERFACE_MESSAGE_TENDON_SNS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace basic_sensor_interface
{
template <class ContainerAllocator>
struct tendon_sns_
{
  typedef tendon_sns_<ContainerAllocator> Type;

  tendon_sns_()
    : prox1(0)
    , dist1(0)
    , hype1(0)
    , prox2(0)
    , dist2(0)
    , hype2(0)
    , prox3(0)
    , dist3(0)
    , hype3(0)  {
    }
  tendon_sns_(const ContainerAllocator& _alloc)
    : prox1(0)
    , dist1(0)
    , hype1(0)
    , prox2(0)
    , dist2(0)
    , hype2(0)
    , prox3(0)
    , dist3(0)
    , hype3(0)  {
  (void)_alloc;
    }



   typedef int32_t _prox1_type;
  _prox1_type prox1;

   typedef int32_t _dist1_type;
  _dist1_type dist1;

   typedef int32_t _hype1_type;
  _hype1_type hype1;

   typedef int32_t _prox2_type;
  _prox2_type prox2;

   typedef int32_t _dist2_type;
  _dist2_type dist2;

   typedef int32_t _hype2_type;
  _hype2_type hype2;

   typedef int32_t _prox3_type;
  _prox3_type prox3;

   typedef int32_t _dist3_type;
  _dist3_type dist3;

   typedef int32_t _hype3_type;
  _hype3_type hype3;





  typedef boost::shared_ptr< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> const> ConstPtr;

}; // struct tendon_sns_

typedef ::basic_sensor_interface::tendon_sns_<std::allocator<void> > tendon_sns;

typedef boost::shared_ptr< ::basic_sensor_interface::tendon_sns > tendon_snsPtr;
typedef boost::shared_ptr< ::basic_sensor_interface::tendon_sns const> tendon_snsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::basic_sensor_interface::tendon_sns_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::basic_sensor_interface::tendon_sns_<ContainerAllocator1> & lhs, const ::basic_sensor_interface::tendon_sns_<ContainerAllocator2> & rhs)
{
  return lhs.prox1 == rhs.prox1 &&
    lhs.dist1 == rhs.dist1 &&
    lhs.hype1 == rhs.hype1 &&
    lhs.prox2 == rhs.prox2 &&
    lhs.dist2 == rhs.dist2 &&
    lhs.hype2 == rhs.hype2 &&
    lhs.prox3 == rhs.prox3 &&
    lhs.dist3 == rhs.dist3 &&
    lhs.hype3 == rhs.hype3;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::basic_sensor_interface::tendon_sns_<ContainerAllocator1> & lhs, const ::basic_sensor_interface::tendon_sns_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace basic_sensor_interface

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> >
{
  static const char* value()
  {
    return "14b8ac042010c67e52d9cebc316f5c93";
  }

  static const char* value(const ::basic_sensor_interface::tendon_sns_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x14b8ac042010c67eULL;
  static const uint64_t static_value2 = 0x52d9cebc316f5c93ULL;
};

template<class ContainerAllocator>
struct DataType< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> >
{
  static const char* value()
  {
    return "basic_sensor_interface/tendon_sns";
  }

  static const char* value(const ::basic_sensor_interface::tendon_sns_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 prox1\n"
"int32 dist1\n"
"int32 hype1\n"
"int32 prox2\n"
"int32 dist2\n"
"int32 hype2\n"
"int32 prox3\n"
"int32 dist3\n"
"int32 hype3\n"
;
  }

  static const char* value(const ::basic_sensor_interface::tendon_sns_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.prox1);
      stream.next(m.dist1);
      stream.next(m.hype1);
      stream.next(m.prox2);
      stream.next(m.dist2);
      stream.next(m.hype2);
      stream.next(m.prox3);
      stream.next(m.dist3);
      stream.next(m.hype3);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct tendon_sns_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::basic_sensor_interface::tendon_sns_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::basic_sensor_interface::tendon_sns_<ContainerAllocator>& v)
  {
    s << indent << "prox1: ";
    Printer<int32_t>::stream(s, indent + "  ", v.prox1);
    s << indent << "dist1: ";
    Printer<int32_t>::stream(s, indent + "  ", v.dist1);
    s << indent << "hype1: ";
    Printer<int32_t>::stream(s, indent + "  ", v.hype1);
    s << indent << "prox2: ";
    Printer<int32_t>::stream(s, indent + "  ", v.prox2);
    s << indent << "dist2: ";
    Printer<int32_t>::stream(s, indent + "  ", v.dist2);
    s << indent << "hype2: ";
    Printer<int32_t>::stream(s, indent + "  ", v.hype2);
    s << indent << "prox3: ";
    Printer<int32_t>::stream(s, indent + "  ", v.prox3);
    s << indent << "dist3: ";
    Printer<int32_t>::stream(s, indent + "  ", v.dist3);
    s << indent << "hype3: ";
    Printer<int32_t>::stream(s, indent + "  ", v.hype3);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BASIC_SENSOR_INTERFACE_MESSAGE_TENDON_SNS_H
