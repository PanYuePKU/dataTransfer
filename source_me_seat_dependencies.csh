#using gcc 4.9 because we need something > 4.8 #at the moment trying gcc5.4 (and compiling protobuf with that gcc version as well)
setenv PATH /imec/software/gcc/5.4/bin/:$PATH

#we are using a python version from an aconda install, to easily have python modules
setenv PATH /imec/other/memseat/public/anaconda2_install/bin/:$PATH
setenv LIBRARY_PATH /imec/other/memseat/public/anaconda2_install/lib/:/imec/other/memseat/public/anaconda2_install/lib/python2.7/config/

#for finding scons
setenv PATH /imec/other/memseat/public/scons-2.5.1_install/bin/:$PATH

#add the protobuf compiler (protoc binary) to PATH
setenv PATH /imec/other/memseat/public/protobuf_install/bin/:$PATH

#add this variable, seems like gem5 could use this
setenv PROTOC /imec/other/memseat/public/protobuf_install/bin/protoc


#Swig is not used anymore in recent versions of gem5, pybind11 has replaced it
#setenv PATH /imec/other/memseat/public/swig-2.0.4_install/bin/:$PATH


#required to find protobuf on the system
setenv PKG_CONFIG_PATH /imec/other/memseat/public/protobuf_install/lib/pkgconfig/

#one or more of these is also needed for protobuf to get found
setenv LIBRARY_PATH /imec/other/memseat/public/protobuf_install/lib/:$LIBRARY_PATH
setenv LD_LIBRARY_PATH /imec/other/memseat/public/protobuf_install/lib/
#setenv LD_LIBRARY_PATH /imec/software/gcc/5.4/LINUX6/lib64/:$LD_LIBRARY_PATH
setenv LD_LIBRARY_PATH /imec/software/gcc/5.4/LINUX6/lib64:$LD_LIBRARY_PATH
setenv LD_LIBRARY_PATH /imec/other/memseat/public/anaconda2_install/lib:$LD_LIBRARY_PATH

#let's try a newer version of m4 # It appears not necessary, so just using default one
#setenv PATH /imec/other/memseat/public/m4-1.4.17_install/bin:$PATH


# inlcude some path to the python2.7 library ld cannot find -lpython2.7 #not necessary anymore apparently
# setenv LIBRARY_PATH /imec/other/memseat/public/anaconda2_install/envs/test/lib/:$LIBRARY_PATH
# setenv LIBRARY_PATH /imec/other/memseat/public/anaconda2_install/envs/test/lib/python2.7/config:$LIBRARY_PATH

## Because the Lirmm version uses an older release of gem5, swig is required!
setenv PATH /imec/other/memseat/public/swig-3.0.12_install/bin/:$PATH

# adding the crosscompiler to the path can be done with the following line: this is the gcc7.2 based cross compiler
setenv PATH /imec/other/memseat/public/cross-compiler/cross/bin:$PATH
# uncomment this line to use the gcc 4.9 based cross-compiler 
setenv PATH /imec/other/memseat/public/cross-compiler/cross_with_older_deps/bin:$PATH
setenv PATH /imec/other/memseat/public/cross-compiler/cross_aarch64/bin:$PATH

# perhaps '.' should be removed from path, was required during build of the cross-compiler

