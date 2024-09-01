## Overview 
This folder contains 12 benchmarks derived from real-world layouts and the solving modulo at the terminal end.
The source code of LocalSMT is located in /solver_src, while other folders contain the benchmarks.

## File structure of benchmarks
Each benchmark contains 3 directories:
1. /sls_smtlib: the formulas deployed to the terminal end, the hard_c.smt2 specifies the overall layout in the outer layer, while others specify the layouts of independent widgets.

2. /src: test.cpp (the source of the two-level solving strategy in the solving module), independent_c_names.hpp (the extracted information by preprocessing method)

3. /display: the directory to display the layout, the *a.html* is the main web page, displaying the layout based on the widgets determined by the solving module.

## Display on Browser
We have already compiled the solving module. You can directly open the *a.html* in the display folder to view the layout on the Browser.
Note that, it is recommended to open it with the *Live Server* or *Live Previewer* extension of VSCode, in case of safety issues caused by Emscripten.

## Build manually
The solving module can be compiled manually by Emscripten. You have to install the Emscripten first. Please refer to https://emscripten.org/ for detailed instructions.
Take the amazon benchmark as an example, you can type the following commands to build the project:
```
cd amazon
chmod a+x ./build.sh
./build.sh
```
The *a.html* in display directory is the corresponding layout.
