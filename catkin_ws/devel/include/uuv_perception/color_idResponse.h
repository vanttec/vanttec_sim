// Generated by gencpp from file uuv_perception/color_idResponse.msg
// DO NOT EDIT!


#ifndef UUV_PERCEPTION_MESSAGE_COLOR_IDRESPONSE_H
#define UUV_PERCEPTION_MESSAGE_COLOR_IDRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace uuv_perception
{
template <class ContainerAllocator>
struct color_idResponse_
{
  typedef color_idResponse_<ContainerAllocator> Type;

  color_idResponse_()
    : color()  {
    }
  color_idResponse_(const ContainerAllocator& _alloc)
    : color(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _color_type;
  _color_type color;





  typedef boost::shared_ptr< ::uuv_perception::color_idResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::uuv_perception::color_idResponse_<ContainerAllocator> const> ConstPtr;

}; // struct color_idResponse_

typedef ::uuv_perception::color_idResponse_<std::allocator<void> > color_idResponse;

typedef boost::shared_ptr< ::uuv_perception::color_idResponse > color_idResponsePtr;
typedef boost::shared_ptr< ::uuv_perception::color_idResponse const> color_idResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::uuv_perception::color_idResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::uuv_perception::color_idResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::uuv_perception::color_idResponse_<ContainerAllocator1> & lhs, const ::uuv_perception::color_idResponse_<ContainerAllocator2> & rhs)
{
  return lhs.color == rhs.color;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::uuv_perception::color_idResponse_<ContainerAllocator1> & lhs, const ::uuv_perception::color_idResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace uuv_perception

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::uuv_perception::color_idResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::uuv_perception::color_idResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::uuv_perception::color_idResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::uuv_perception::color_idResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::uuv_perception::color_idResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::uuv_perception::color_idResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::uuv_perception::color_idResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "89e44dcab627a2c43a70ae1100695caa";
  }

  static const char* value(const ::uuv_perception::color_idResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x89e44dcab627a2c4ULL;
  static const uint64_t static_value2 = 0x3a70ae1100695caaULL;
};

template<class ContainerAllocator>
struct DataType< ::uuv_perception::color_idResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uuv_perception/color_idResponse";
  }

  static const char* value(const ::uuv_perception::color_idResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::uuv_perception::color_idResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string color\n"
"\n"
;
  }

  static const char* value(const ::uuv_perception::color_idResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::uuv_perception::color_idResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.color);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct color_idResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::uuv_perception::color_idResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::uuv_perception::color_idResponse_<ContainerAllocator>& v)
  {
    s << indent << "color: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.color);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UUV_PERCEPTION_MESSAGE_COLOR_IDRESPONSE_H
