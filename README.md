# spirv-tools-meson
Experimental (read: quick and dirty) support for meson wrap for spirv-tools.

This is a bundle of the needed files to include spirv-tools (built using 64bit mingw) to a meson project.

It uses a shell script to call cmake from meson.build file, so there might be some rough edges. Rewriting the cmake files of spirv-tools to meson would be a non-trivial task, so this is a compromise.

## usage

Create a subproject directory in the target project, copy the spirv-tools.wrap file there. Use the files in the project - they are installed into builddir/install (libSPIRV-Tools-opt.a...).

