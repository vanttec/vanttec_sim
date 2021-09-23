# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "uuv_perception: 3 messages, 1 services")

set(MSG_I_FLAGS "-Iuuv_perception:/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(uuv_perception_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg" NAME_WE)
add_custom_target(_uuv_perception_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "uuv_perception" "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg" ""
)

get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected_list.msg" NAME_WE)
add_custom_target(_uuv_perception_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "uuv_perception" "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected_list.msg" "uuv_perception/obj_detected"
)

get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obstacles_list.msg" NAME_WE)
add_custom_target(_uuv_perception_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "uuv_perception" "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obstacles_list.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/srv/color_id.srv" NAME_WE)
add_custom_target(_uuv_perception_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "uuv_perception" "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/srv/color_id.srv" "sensor_msgs/Image:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uuv_perception
)
_generate_msg_cpp(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected_list.msg"
  "${MSG_I_FLAGS}"
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uuv_perception
)
_generate_msg_cpp(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obstacles_list.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uuv_perception
)

### Generating Services
_generate_srv_cpp(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/srv/color_id.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uuv_perception
)

### Generating Module File
_generate_module_cpp(uuv_perception
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uuv_perception
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(uuv_perception_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(uuv_perception_generate_messages uuv_perception_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_cpp _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected_list.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_cpp _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obstacles_list.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_cpp _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/srv/color_id.srv" NAME_WE)
add_dependencies(uuv_perception_generate_messages_cpp _uuv_perception_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(uuv_perception_gencpp)
add_dependencies(uuv_perception_gencpp uuv_perception_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS uuv_perception_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uuv_perception
)
_generate_msg_eus(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected_list.msg"
  "${MSG_I_FLAGS}"
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uuv_perception
)
_generate_msg_eus(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obstacles_list.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uuv_perception
)

### Generating Services
_generate_srv_eus(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/srv/color_id.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uuv_perception
)

### Generating Module File
_generate_module_eus(uuv_perception
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uuv_perception
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(uuv_perception_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(uuv_perception_generate_messages uuv_perception_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_eus _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected_list.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_eus _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obstacles_list.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_eus _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/srv/color_id.srv" NAME_WE)
add_dependencies(uuv_perception_generate_messages_eus _uuv_perception_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(uuv_perception_geneus)
add_dependencies(uuv_perception_geneus uuv_perception_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS uuv_perception_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uuv_perception
)
_generate_msg_lisp(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected_list.msg"
  "${MSG_I_FLAGS}"
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uuv_perception
)
_generate_msg_lisp(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obstacles_list.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uuv_perception
)

### Generating Services
_generate_srv_lisp(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/srv/color_id.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uuv_perception
)

### Generating Module File
_generate_module_lisp(uuv_perception
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uuv_perception
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(uuv_perception_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(uuv_perception_generate_messages uuv_perception_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_lisp _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected_list.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_lisp _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obstacles_list.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_lisp _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/srv/color_id.srv" NAME_WE)
add_dependencies(uuv_perception_generate_messages_lisp _uuv_perception_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(uuv_perception_genlisp)
add_dependencies(uuv_perception_genlisp uuv_perception_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS uuv_perception_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uuv_perception
)
_generate_msg_nodejs(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected_list.msg"
  "${MSG_I_FLAGS}"
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uuv_perception
)
_generate_msg_nodejs(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obstacles_list.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uuv_perception
)

### Generating Services
_generate_srv_nodejs(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/srv/color_id.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uuv_perception
)

### Generating Module File
_generate_module_nodejs(uuv_perception
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uuv_perception
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(uuv_perception_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(uuv_perception_generate_messages uuv_perception_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_nodejs _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected_list.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_nodejs _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obstacles_list.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_nodejs _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/srv/color_id.srv" NAME_WE)
add_dependencies(uuv_perception_generate_messages_nodejs _uuv_perception_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(uuv_perception_gennodejs)
add_dependencies(uuv_perception_gennodejs uuv_perception_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS uuv_perception_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uuv_perception
)
_generate_msg_py(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected_list.msg"
  "${MSG_I_FLAGS}"
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uuv_perception
)
_generate_msg_py(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obstacles_list.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uuv_perception
)

### Generating Services
_generate_srv_py(uuv_perception
  "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/srv/color_id.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uuv_perception
)

### Generating Module File
_generate_module_py(uuv_perception
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uuv_perception
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(uuv_perception_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(uuv_perception_generate_messages uuv_perception_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_py _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obj_detected_list.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_py _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/msg/obstacles_list.msg" NAME_WE)
add_dependencies(uuv_perception_generate_messages_py _uuv_perception_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/glazz/code/vanttec_uv_sim/catkin_ws/src/uuv_perception/srv/color_id.srv" NAME_WE)
add_dependencies(uuv_perception_generate_messages_py _uuv_perception_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(uuv_perception_genpy)
add_dependencies(uuv_perception_genpy uuv_perception_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS uuv_perception_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uuv_perception)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uuv_perception
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(uuv_perception_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(uuv_perception_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(uuv_perception_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uuv_perception)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uuv_perception
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(uuv_perception_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(uuv_perception_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(uuv_perception_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uuv_perception)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uuv_perception
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(uuv_perception_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(uuv_perception_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(uuv_perception_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uuv_perception)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uuv_perception
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(uuv_perception_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(uuv_perception_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(uuv_perception_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uuv_perception)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uuv_perception\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uuv_perception
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(uuv_perception_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(uuv_perception_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(uuv_perception_generate_messages_py std_msgs_generate_messages_py)
endif()
