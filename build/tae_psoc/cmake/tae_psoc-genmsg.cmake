# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "tae_psoc: 4 messages, 0 services")

set(MSG_I_FLAGS "-Itae_psoc:/home/wilson/ros_ws_1/src/tae_psoc/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(tae_psoc_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Indiv.msg" NAME_WE)
add_custom_target(_tae_psoc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tae_psoc" "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Indiv.msg" ""
)

get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/SensorPacket.msg" NAME_WE)
add_custom_target(_tae_psoc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tae_psoc" "/home/wilson/ros_ws_1/src/tae_psoc/msg/SensorPacket.msg" ""
)

get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Fast.msg" NAME_WE)
add_custom_target(_tae_psoc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tae_psoc" "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Fast.msg" ""
)

get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/cmdToPsoc.msg" NAME_WE)
add_custom_target(_tae_psoc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tae_psoc" "/home/wilson/ros_ws_1/src/tae_psoc/msg/cmdToPsoc.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Indiv.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tae_psoc
)
_generate_msg_cpp(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/SensorPacket.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tae_psoc
)
_generate_msg_cpp(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Fast.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tae_psoc
)
_generate_msg_cpp(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/cmdToPsoc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tae_psoc
)

### Generating Services

### Generating Module File
_generate_module_cpp(tae_psoc
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tae_psoc
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(tae_psoc_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(tae_psoc_generate_messages tae_psoc_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Indiv.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_cpp _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/SensorPacket.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_cpp _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Fast.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_cpp _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/cmdToPsoc.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_cpp _tae_psoc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tae_psoc_gencpp)
add_dependencies(tae_psoc_gencpp tae_psoc_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tae_psoc_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Indiv.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tae_psoc
)
_generate_msg_eus(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/SensorPacket.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tae_psoc
)
_generate_msg_eus(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Fast.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tae_psoc
)
_generate_msg_eus(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/cmdToPsoc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tae_psoc
)

### Generating Services

### Generating Module File
_generate_module_eus(tae_psoc
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tae_psoc
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(tae_psoc_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(tae_psoc_generate_messages tae_psoc_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Indiv.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_eus _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/SensorPacket.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_eus _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Fast.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_eus _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/cmdToPsoc.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_eus _tae_psoc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tae_psoc_geneus)
add_dependencies(tae_psoc_geneus tae_psoc_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tae_psoc_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Indiv.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tae_psoc
)
_generate_msg_lisp(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/SensorPacket.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tae_psoc
)
_generate_msg_lisp(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Fast.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tae_psoc
)
_generate_msg_lisp(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/cmdToPsoc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tae_psoc
)

### Generating Services

### Generating Module File
_generate_module_lisp(tae_psoc
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tae_psoc
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(tae_psoc_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(tae_psoc_generate_messages tae_psoc_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Indiv.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_lisp _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/SensorPacket.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_lisp _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Fast.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_lisp _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/cmdToPsoc.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_lisp _tae_psoc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tae_psoc_genlisp)
add_dependencies(tae_psoc_genlisp tae_psoc_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tae_psoc_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Indiv.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tae_psoc
)
_generate_msg_nodejs(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/SensorPacket.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tae_psoc
)
_generate_msg_nodejs(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Fast.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tae_psoc
)
_generate_msg_nodejs(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/cmdToPsoc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tae_psoc
)

### Generating Services

### Generating Module File
_generate_module_nodejs(tae_psoc
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tae_psoc
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(tae_psoc_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(tae_psoc_generate_messages tae_psoc_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Indiv.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_nodejs _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/SensorPacket.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_nodejs _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Fast.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_nodejs _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/cmdToPsoc.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_nodejs _tae_psoc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tae_psoc_gennodejs)
add_dependencies(tae_psoc_gennodejs tae_psoc_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tae_psoc_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Indiv.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tae_psoc
)
_generate_msg_py(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/SensorPacket.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tae_psoc
)
_generate_msg_py(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Fast.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tae_psoc
)
_generate_msg_py(tae_psoc
  "/home/wilson/ros_ws_1/src/tae_psoc/msg/cmdToPsoc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tae_psoc
)

### Generating Services

### Generating Module File
_generate_module_py(tae_psoc
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tae_psoc
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(tae_psoc_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(tae_psoc_generate_messages tae_psoc_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Indiv.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_py _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/SensorPacket.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_py _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/Sensor_Fast.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_py _tae_psoc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wilson/ros_ws_1/src/tae_psoc/msg/cmdToPsoc.msg" NAME_WE)
add_dependencies(tae_psoc_generate_messages_py _tae_psoc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tae_psoc_genpy)
add_dependencies(tae_psoc_genpy tae_psoc_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tae_psoc_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tae_psoc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tae_psoc
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tae_psoc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tae_psoc
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tae_psoc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tae_psoc
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tae_psoc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tae_psoc
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tae_psoc)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tae_psoc\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tae_psoc
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tae_psoc
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tae_psoc/.+/__init__.pyc?$"
  )
endif()
