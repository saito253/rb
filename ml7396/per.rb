#! /usr/bin/ruby

if RUBY_PLATFORM ==  "x64-mingw32" then
    require 'rubygems'
    require 'serialport'

	print("input COM number => ")
    com = gets().to_i
    com = "COM" + com.to_s

    $SERIAL_PORT =com
    $SERIAL_BAUDRATE=115200
#   sp = SerialPort.new(SERIAL_PORT, SERIAL_BAUDRATE)
#   sp.read_timeout=500
#   sp.puts("sggma")
#   p sp.gets()
#   SERIAL_BAUDRATE="115200, 8, 1, 0"
#   SerialPort.new(serial_port, 115200, 8, 1, 0)
else
    require 'serialport'
    if $SERIAL_PORT == nil then
        $SERIAL_PORT ='/dev/ttyUSB0'
        print "Replace SERIAL_PORT"
    end
    $SERIAL_BAUDRATE=115200
end

sp = SerialPort.new($SERIAL_PORT,$SERIAL_BAUDRATE)
sp.read_timeout=500

    sp.puts("sgi")
    p sp.gets()
    sleep 0.5

    sp.puts("sgb,24,0xabcd,100,20")
    p sp.gets()
    sleep 0.5

#------------------------------------------------------------------------------
#0x79,7A,7B    TEST_SW(Select RX Moniter)
#------------------------------------------------------------------------------
    sp.puts("rfw,9,0x79,0x00")
    p sp.gets()
    sleep 0.5

    sp.puts("rfw,9,0x7A,0x21")
    p sp.gets()
    sleep 0.5

    sp.puts("rfw,9,0x7B,0x28")
    p sp.gets()
    sleep 0.5

#------------------------------------------------------------------------------
#0x03    AMON
#------------------------------------------------------------------------------
    sp.puts("rfw,9,0x03,0x01")
    p sp.gets()
    sleep 0.5
    
#------------------------------------------------------------------------------
#0x01    DeMset00([7]ber_mode_on)
#------------------------------------------------------------------------------
    sp.puts("rfw,9,0x01,0x80")
    p sp.gets()
    sleep 0.5

#------------------------------------------------------------------------------
#0x69    STRM_ON(DIO_TP4,DCLK_TP3 OUT)
#------------------------------------------------------------------------------
    sp.puts("rfw,8,0x69,0x01")
    p sp.gets()
    sleep 0.5

#------------------------------------------------------------------------------
#0x0B    RX_ON
#------------------------------------------------------------------------------
    sp.puts("rfw,8,0x6c,0x06")
    p sp.gets()
    sleep 0.5
