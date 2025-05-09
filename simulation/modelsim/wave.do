onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Fetch Stage}
add wave -noupdate /Fetch/clk_i
add wave -noupdate /Fetch/rst_ni
add wave -noupdate /Fetch/if_inst_o
add wave -noupdate /Fetch/hit_o
add wave -noupdate /Fetch/rst_addr_w
add wave -noupdate /Fetch/pc_next_r
add wave -noupdate /Fetch/pc_w
add wave -noupdate -divider iCache
add wave -noupdate /Fetch/icachel1/clk_i
add wave -noupdate /Fetch/icachel1/pc_i
add wave -noupdate /Fetch/icachel1/we_i
add wave -noupdate /Fetch/icachel1/inst_i
add wave -noupdate /Fetch/icachel1/re_i
add wave -noupdate /Fetch/icachel1/inst_o
add wave -noupdate /Fetch/icachel1/hit
add wave -noupdate /Fetch/icachel1/memoria
add wave -noupdate /Fetch/icachel1/valid
add wave -noupdate /Fetch/icachel1/tag
add wave -noupdate /Fetch/icachel1/idx_w
add wave -noupdate /Fetch/icachel1/tag_iw
add wave -noupdate /Fetch/icachel1/idx_r
add wave -noupdate /Fetch/icachel1/tag_mw
add wave -noupdate /Fetch/icachel1/valid_w
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {80 ns} {416 ns}
