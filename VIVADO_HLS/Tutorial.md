

### Vivado HLS C/C++ Limitations
- No DYNAMIC memory (All need to be STATIC)
- No STD, FILE-I/O, ETC. (No system Calls)
- Avoid Recursive Functions
- Generated code is NOT the MOST READABLE
- Sometimes you want something smaller than CTRL-UNIT + DATAPATH.
- Sometimes you want more CONTROL on the GENERATED CODE.
