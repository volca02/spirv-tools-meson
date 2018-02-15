project('spirv-tools')

cmake   = find_program('cmake')
builder = find_program('build.sh')

outfile = 'libSPIRV-Tools-opt.a'

# we only need to do enough to produce the library
mytarget = custom_target('build',
  command : [builder],
  output : 'libSPIRV-Tools-opt.a',
  install_dir : 'install/lib',
  install : false,
  build_by_default: true
)

