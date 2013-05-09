onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_cpu/CLK
add wave -noupdate /mp3_cpu/aPipelineDP/sIF/BranchUnit/BRTagArray2/Tag
add wave -noupdate /mp3_cpu/aPipelineDP/sIF/BranchUnit/BRTagArray3/Tag
add wave -noupdate /mp3_cpu/aPipelineDP/sIF/BranchUnit/Hit
add wave -noupdate /mp3_cpu/aPipelineDP/sIF/BranchUnit/RComp0out
add wave -noupdate /mp3_cpu/aPipelineDP/sIF/BranchUnit/RComp1out
add wave -noupdate /mp3_cpu/aPipelineDP/sIF/BranchUnit/Raddr
add wave -noupdate /mp3_cpu/aPipelineDP/sIF/BranchUnit/Waddr
add wave -noupdate /mp3_cpu/aPipelineDP/sIF/BranchUnit/AddrOut
add wave -noupdate /mp3_cpu/aPipelineDP/sIF/BranchUnit/CondOut
add wave -noupdate -radix hexadecimal /mp3_cpu/PipeMem/miCache/mIcacheDatapath/DATAOUT0
add wave -noupdate -radix hexadecimal /mp3_cpu/PipeMem/miCache/mIcacheDatapath/DataOut1
add wave -noupdate -expand /mp3_cpu/PipeMem/miCache/mIcacheDatapath/aDataArray0/Data
add wave -noupdate -expand /mp3_cpu/PipeMem/miCache/mIcacheDatapath/aDataArray1/Data
add wave -noupdate /mp3_cpu/PipeMem/miCache/mIcacheDatapath/LRUBit/Bit
add wave -noupdate /mp3_cpu/PipeMem/miCache/mIcacheDatapath/DataWrite0
add wave -noupdate /mp3_cpu/PipeMem/miCache/mIcacheDatapath/DataWrite1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {320566 ns} {323723 ns}
