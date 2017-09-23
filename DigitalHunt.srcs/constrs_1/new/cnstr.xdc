# Clock signal 
set_property PACKAGE_PIN W5 [get_ports clk]  	 	 	 	  
 	set_property IOSTANDARD LVCMOS33 [get_ports clk] 
# create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk] 


# Switches 
set_property PACKAGE_PIN V17 [get_ports reset] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports reset]  
set_property PACKAGE_PIN V16 [get_ports start] 	 	 	 	 	 
      set_property IOSTANDARD LVCMOS33 [get_ports start]  

# LEDs 
set_property PACKAGE_PIN U16 [get_ports tempLed]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports tempLed] 

##Buttons 
 set_property PACKAGE_PIN U18 [get_ports fire]                           
      set_property IOSTANDARD LVCMOS33 [get_ports fire] 
 set_property PACKAGE_PIN T18 [get_ports up]                           
      set_property IOSTANDARD LVCMOS33 [get_ports up] 
 set_property PACKAGE_PIN W19 [get_ports left]                           
      set_property IOSTANDARD LVCMOS33 [get_ports left] 
 set_property PACKAGE_PIN T17 [get_ports right]                           
      set_property IOSTANDARD LVCMOS33 [get_ports right] 
 set_property PACKAGE_PIN U17 [get_ports down]                           
      set_property IOSTANDARD LVCMOS33 [get_ports down] 

##VGA Connector 
set_property PACKAGE_PIN G19 [get_ports {red[0]}] 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {red[0]}] 
set_property PACKAGE_PIN H19 [get_ports {red[1]}] 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {red[1]}] 
set_property PACKAGE_PIN J19 [get_ports {red[2]}] 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {red[2]}] 
set_property PACKAGE_PIN N19 [get_ports {red[3]}] 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {red[3]}] 
set_property PACKAGE_PIN N18 [get_ports {blue[0]}] 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {blue[0]}] 
set_property PACKAGE_PIN L18 [get_ports {blue[1]}] 	 	 	 	  		
    set_property IOSTANDARD LVCMOS33 [get_ports {blue[1]}] 
set_property PACKAGE_PIN K18 [get_ports {blue[2]}] 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {blue[2]}] 
set_property PACKAGE_PIN J18 [get_ports {blue[3]}] 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {blue[3]}] 
set_property PACKAGE_PIN J17 [get_ports {green[0]}]  	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {green[0]}] 
set_property PACKAGE_PIN H17 [get_ports {green[1]}]  	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {green[1]}] 
set_property PACKAGE_PIN G17 [get_ports {green[2]}]  	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {green[2]}] 
set_property PACKAGE_PIN D17 [get_ports {green[3]}]  	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {green[3]}] 
set_property PACKAGE_PIN P19 [get_ports hsync] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports hsync] 
set_property PACKAGE_PIN R19 [get_ports vsync] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports vsync]
 	

#7 ledsment display 
set_property PACKAGE_PIN W7 [get_ports leds[6]] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports leds[6]] 
set_property PACKAGE_PIN W6 [get_ports leds[5]] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports leds[5]] 
set_property PACKAGE_PIN U8 [get_ports leds[4]] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports leds[4]] 
set_property PACKAGE_PIN V8 [get_ports {leds[3]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports leds[3]] 
set_property PACKAGE_PIN U5 [get_ports leds[2]] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports leds[2]] 
set_property PACKAGE_PIN V5 [get_ports leds[1]] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports leds[1]] 
set_property PACKAGE_PIN U7 [get_ports leds[0]] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports leds[0]] 
set_property PACKAGE_PIN V7 [get_ports dp]  	 	 	 	  
 	set_property IOSTANDARD LVCMOS33 [get_ports dp] 
set_property PACKAGE_PIN U2 [get_ports anode[3]] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports anode[3]] 
set_property PACKAGE_PIN U4 [get_ports anode[2]] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports anode[2]] 
set_property PACKAGE_PIN V4 [get_ports anode[1]] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports anode[1]] 
set_property PACKAGE_PIN W4 [get_ports anode[0]] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports anode[0]] 


#Dot matrix
set_property PACKAGE_PIN K17 [get_ports {DS}]
set_property IOSTANDARD LVCMOS33 [get_ports {DS}]
##Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports oe]
set_property IOSTANDARD LVCMOS33 [get_ports oe]
##Sch name = JC3
set_property PACKAGE_PIN N17 [get_ports {ST_CP}]
set_property IOSTANDARD LVCMOS33 [get_ports {ST_CP}]
##Sch name = JC4
set_property PACKAGE_PIN P18 [get_ports {SH_CP}]
set_property IOSTANDARD LVCMOS33 [get_ports {SH_CP}]
##Sch name = JC7
set_property PACKAGE_PIN L17 [get_ports {reset2}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset2}]
##Sch name = JC8


set_property PACKAGE_PIN A14 [get_ports {rows[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {rows[0]}] 
##Sch name = JB2 
set_property PACKAGE_PIN A16 [get_ports {rows[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {rows[1]}] 
##Sch name = JB3 
set_property PACKAGE_PIN B15 [get_ports {rows[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {rows[2]}] 
set_property PACKAGE_PIN B16 [get_ports {rows[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {rows[3]}] 
##Sch name = JB7 
set_property PACKAGE_PIN A15 [get_ports {rows[4]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {rows[4]}] 
##Sch name = JB8 
set_property PACKAGE_PIN A17 [get_ports {rows[5]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {rows[5]}] 
##Sch name = JB9 
set_property PACKAGE_PIN C15 [get_ports {rows[6]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {rows[6]}] 
##Sch name = JB10 
set_property PACKAGE_PIN C16 [get_ports {rows[7]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {rows[7]}] 	