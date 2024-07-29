file(REMOVE_RECURSE
  "ind_cpp.js"
  "ind_cpp.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/ind_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
