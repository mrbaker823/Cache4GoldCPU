echo "--- Executing initialization force file for ../testcode/multOUT.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5

echo "Done initializing processor, loading ../testcode/multOUT.asm program code."
run 5
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(0) X"21"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(1) X"10"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(2) X"7C"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(3) X"12"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(4) X"19"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(5) X"80"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(6) X"61"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(7) X"12"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(8) X"FD"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(9) X"09"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(10) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(11) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(12) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(13) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(14) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(15) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(16) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(17) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(18) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(19) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(20) X"BC"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(21) X"12"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(22) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(23) X"90"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(24) X"21"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(25) X"80"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(26) X"61"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(27) X"12"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(28) X"FD"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(29) X"09"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(30) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(31) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(32) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(33) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(34) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(35) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(36) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(37) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(38) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(39) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(40) X"12"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(41) X"84"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(42) X"8A"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(43) X"86"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(44) X"90"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(45) X"84"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(46) X"A1"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(47) X"1D"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(48) X"80"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(49) X"8F"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(50) X"06"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(51) X"80"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(52) X"06"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(53) X"80"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(54) X"C0"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(55) X"9F"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(56) X"2E"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(57) X"82"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(58) X"48"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(59) X"9B"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(60) X"16"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(61) X"9A"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(62) X"58"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(63) X"9D"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(64) X"60"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(65) X"9F"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(66) X"AF"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(67) X"9D"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(68) X"F2"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(69) X"9E"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(70) X"FF"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(71) X"0F"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(72) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(73) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(74) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(75) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(76) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(77) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(78) X"00"
change mp3_cpu/PipeMem/DRAM_MP3/vhdl_memory/mem(79) X"00"
run 5
echo "Done loading ../testcode/multOUT.asm program code."
