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

    sp.puts("sgi,0,0")
    p sp.gets()
    sleep 0.5

    sp.puts("sgb,24,0xabcd,100,20")
    p sp.gets()
    p sp.gets()
    sleep 0.5

#------------------------------------------------------------------------------
#   sendln 'WREG 00 22'
#   waitln 'OK'
#------------------------------------------------------------------------------
#0x0E    GAIN_HOLD
#------------------------------------------------------------------------------
    sp.puts("rfw,1,0x0e,0x00")
    p sp.gets()
    sleep 0.5
#------------------------------------------------------------------------------
#0x00    BANK3
#------------------------------------------------------------------------------
#   sendln 'WREG 00 88'
#   waitln 'OK'
#------------------------------------------------------------------------------
#0x0D    DEMOD_SET24
#------------------------------------------------------------------------------
    sp.puts("rfw,3,0x0D,0x33")
    p sp.gets()
    sleep 0.5
#------------------------------------------------------------------------------
#0x00    BANK0
#------------------------------------------------------------------------------
#   sendln 'WREG 00 11'
#   waitln 'OK'
#------------------------------------------------------------------------------
#0x0C    DIO_SET
#------------------------------------------------------------------------------
    sp.puts("rfw,0,0x0C,0x40")
    p sp.gets()
    sleep 0.5
#------------------------------------------------------------------------------
#0x4D    MON_CTRL
#------------------------------------------------------------------------------
    sp.puts("rfw,0,0x4D,0x80")
    p sp.gets()
    sleep 0.5
#------------------------------------------------------------------------------
#0x4E    GPIO0_CTRL(DCLK)
#------------------------------------------------------------------------------
    sp.puts("rfw,0,0x4E,0x05")
    p sp.gets()
    sleep 0.5
#------------------------------------------------------------------------------
#0x52    GPIO1_CTRL(DIO)
#------------------------------------------------------------------------------
    sp.puts("rfw,0,0x4F,0x04")
    p sp.gets()
    sleep 0.5
#------------------------------------------------------------------------------
#0x0B    RX_ON
#------------------------------------------------------------------------------
    sp.puts("rfw,0,0x0b,0x06")
    p sp.gets()
    sleep 0.5
