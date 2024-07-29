# CMake 最低版本要求
cmake_minimum_required(VERSION 3.10)

# 项目名称
project(MyProject)

# 设置编译器和编译选项
# set(CMAKE_CXX_COMPILER g++)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "-O3 -w")


# 设置源文件夹
set(SLS_DIR ${CMAKE_SOURCE_DIR}/src/sls_solver)
set(SRC_DIR ${CMAKE_SOURCE_DIR}/src)
set(OVERALL_DIR ${CMAKE_SOURCE_DIR}/src/sls_solver_overall)
set(UTILS_DIR ${CMAKE_SOURCE_DIR}/src/utils)

# 将源文件添加到变量中
file(GLOB A_SOURCES ${SLS_DIR}/*.cpp ${SLS_DIR}/*.h)
file(GLOB B_SOURCES ${SRC_DIR}/*.cpp ${SRC_DIR}/*.hpp)
file(GLOB C_SOURCES ${OVERALL_DIR}/*.cpp ${OVERALL_DIR}/*.h)
file(GLOB D_SOURCES ${UTILS_DIR}/*.cpp ${UTILS_DIR}/*.h)

# 将源文件编译为目标文件
add_library(a_sources OBJECT ${A_SOURCES})
add_library(b_sources OBJECT ${B_SOURCES})
add_library(c_sources OBJECT ${C_SOURCES})
add_library(d_sources OBJECT ${D_SOURCES})

# 创建可执行文件并链接目标文件
add_executable(ind_cpp $<TARGET_OBJECTS:a_sources> $<TARGET_OBJECTS:b_sources> $<TARGET_OBJECTS:c_sources> $<TARGET_OBJECTS:d_sources>
)
set_target_properties(ind_cpp PROPERTIES
    OUTPUT_NAME "ind_cpp"
    SUFFIX ".js"
    LINK_FLAGS "-s MODULARIZE=1 -s EXPORT_NAME=createModule -lembind"
)
target_link_options(ind_cpp PRIVATE --preload-file ${CMAKE_SOURCE_DIR}/sls_smtlib@/sls_smtlib)