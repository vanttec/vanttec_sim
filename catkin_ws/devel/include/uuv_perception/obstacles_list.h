// Generated by gencpp from file uuv_perception/obstacles_list.msg
// DO NOT EDIT!


#ifndef UUV_PERCEPTION_MESSAGE_OBSTACLES_LIST_H
#define UUV_PERCEPTION_MESSAGE_OBSTACLES_LIST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Vector3.h>

namespace uuv_perception
{
template <class ContainerAllocator>
struct obstacles_list_
{
  typedef obstacles_list_<ContainerAllocator> Type;

  obstacles_list_()
    : len(0)
    , obstacles()  {
    }
  obstacles_list_(const ContainerAllocator& _alloc)
    : len(0)
    , obstacles(_alloc)  {
  (void)_alloc;
    }



   typedef int64_t _len_type;
  _len_type len;

   typedef std::vector< ::geometry_msgs::Vector3_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::geometry_msgs::Vector3_<ContainerAllocator> >::other >  _obstacles_type;
  _obstacles_type obstacles;





  typedef boost::shared_ptr< ::uuv_perception::obstacles_list_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::uuv_perception::obstacles_list_<ContainerAllocator> const> ConstPtr;

}; // struct obstacles_list_

typedef ::uuv_perception::obstacles_list_<std::allocator<void> > obstacles_list;

typedef boost::shared_ptr< ::uuv_perception::obstacles_list > obstacles_listPtr;
typedef boost::shared_ptr< ::uuv_perception::obstacles_list const> obstacles_listConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::uuv_perception::obstacles_list_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::uuv_perception::obstacles_list_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::uuv_perception::obstacles_list_<ContainerAllocator1> & lhs, const ::uuv_perception::obstacles_list_<ContainerAllocator2> & rhs)
{
  return lhs.len == rhs.len &&
    lhs.obstacles == rhs.obstacles;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::uuv_perception::obstacles_list_<ContainerAllocator1> & lhs, const ::uuv_perception::obstacles_list_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace uuv_perception

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::uuv_perception::obstacles_list_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::uuv_perception::obstacles_list_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::uuv_perception::obstacles_list_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::uuv_perception::obstacles_list_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::uuv_perception::obstacles_list_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::uuv_perception::obstacles_list_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::uuv_perception::obstacles_list_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a453c0a1913f2b0504b7bfd6d9fa3f87";
  }

  static const char* value(const ::uuv_perception::obstacles_list_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa453c0a1913f2b05ULL;
  static const uint64_t static_value2 = 0x04b7bfd6d9fa3f87ULL;
};

template<class ContainerAllocator>
struct DataType< ::uuv_perception::obstacles_list_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uuv_perception/obstacles_list";
  }

  static const char* value(const ::uuv_perception::obstacles_list_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::uuv_perception::obstacles_list_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 len\n"
"geometry_msgs/Vector3[] obstacles\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::uuv_perception::obstacles_list_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::uuv_perception::obstacles_list_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.len);
      stream.next(m.obstacles);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct obstacles_list_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::uuv_perception::obstacles_list_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::uuv_perception::obstacles_list_<ContainerAllocator>& v)
  {
    s << indent << "len: ";
    Printer<int64_t>::stream(s, indent + "  ", v.len);
    s << indent << "obstacles[]" << std::endl;
    for (size_t i = 0; i < v.obstacles.size(); ++i)
    {
      s << indent << "  obstacles[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "    ", v.obstacles[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // UUV_PERCEPTION_MESSAGE_OBSTACLES_LIST_H
