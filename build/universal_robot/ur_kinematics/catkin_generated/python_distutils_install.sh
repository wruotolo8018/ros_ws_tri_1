#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/wilson/ros_ws_1/src/universal_robot/ur_kinematics"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/wilson/ros_ws_1/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/wilson/ros_ws_1/install/lib/python2.7/dist-packages:/home/wilson/ros_ws_1/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/wilson/ros_ws_1/build" \
    "/usr/bin/python2" \
    "/home/wilson/ros_ws_1/src/universal_robot/ur_kinematics/setup.py" \
    build --build-base "/home/wilson/ros_ws_1/build/universal_robot/ur_kinematics" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/wilson/ros_ws_1/install" --install-scripts="/home/wilson/ros_ws_1/install/bin"
