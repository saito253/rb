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

print("DSSS 200kcps TEST ===========================>")
    gets()
    sp.puts("sgi,0x10,16")
    p sp.gets()
    sleep 0.5
    sp.puts("sgb,24,0xabcd,200,20")
    p sp.gets()
    p sp.gets()
    sleep 0.5
    sp.puts("rfw,0,0x0b,0x09")
    p sp.gets()
    sleep 0.5
    print("Check the center frequency:")
    gets()
    sp.puts("rfr,0,0x09")
    p sp.gets()
    sleep 0.5
    sp.puts("rfw,0,0x09,0x01")
    p sp.gets()
    sleep 0.5
    print("Check the next frequency:")
    gets()
    sp.puts("rfw,0,0x76,0x03")
    p sp.gets()
    sleep 0.5
    print("Check the modulation:")
    gets()

print("DSSS 100kcps TEST ===========================>")
    gets()
    sp.puts("sgi,0x10,16")
    p sp.gets()
    sleep 0.5
    sp.puts("sgb,24,0xabcd,100,20")
    p sp.gets()
    p sp.gets()
    sleep 0.5
    sp.puts("rfw,0,0x0b,0x09")
    p sp.gets()
    sleep 0.5
    print("Check the center frequency:")
    gets()
    sp.puts("rfr,0,0x09")
    p sp.gets()
    sleep 0.5
    sp.puts("rfw,0,0x09,0x01")
    p sp.gets()
    sleep 0.5
    print("Check the next frequency:")
    gets()
    sp.puts("rfw,0,0x76,0x03")
    p sp.gets()
    sleep 0.5
    print("Check the modulation:")
    gets()

print("DSSS 50kcps TEST ===========================>")
    gets()
    sp.puts("sgi,0x10,16")
    p sp.gets()
    sleep 0.5
    sp.puts("sgb,24,0xabcd,50,20")
    p sp.gets()
    p sp.gets()
    sleep 0.5
    sp.puts("rfw,0,0x0b,0x09")
    p sp.gets()
    sleep 0.5
    print("Check the center frequency:")
    gets()
    sp.puts("rfr,0,0x09")
    p sp.gets()
    sleep 0.5
    sp.puts("rfw,0,0x09,0x01")
    p sp.gets()
    sleep 0.5
    print("Check the next frequency:")
    gets()
    sp.puts("rfw,0,0x76,0x03")
    p sp.gets()
    sleep 0.5
    print("Check the modulation:")
    gets()

print("SigFox 100bps TEST ===========================>")
    gets()
    sp.puts("sgi,0x20,16")
    p sp.gets()
    sleep 0.5
    sp.puts("sgb,24,0xabcd,100,20")
    p sp.gets()
    p sp.gets()
    sleep 0.5
    sp.puts("rfw,0,0x0b,0x09")
    p sp.gets()
    sleep 0.5
    print("Check the center frequency:")
    gets()
    sp.puts("rfr,0,0x09")
    p sp.gets()
    sleep 0.5
    sp.puts("rfw,0,0x09,0x01")
    p sp.gets()
    sleep 0.5
    print("Check the next frequency:")
    gets()
    sp.puts("rfw,0,0x76,0x03")
    p sp.gets()
    sleep 0.5
    print("Check the modulation:")
    gets()

print("FSK 100kbps TEST ===========================>")
    gets()
    sp.puts("sgi,0x00,16")
    p sp.gets()
    sleep 0.5
    sp.puts("sgb,24,0xabcd,100,20")
    p sp.gets()
    p sp.gets()
    sleep 0.5
    sp.puts("rfw,0,0x0b,0x09")
    p sp.gets()
    sleep 0.5
    print("Check the center frequency:")
    gets()
    sp.puts("rfr,0,0x09")
    p sp.gets()
    sleep 0.5
    sp.puts("rfw,0,0x09,0x01")
    p sp.gets()
    sleep 0.5
    print("Check the next frequency:")
    gets()
    sp.puts("rfw,0,0x76,0x03")
    p sp.gets()
    sleep 0.5
    print("Check the modulation:")
    gets()

print("FSK 50kbps TEST ===========================>")
    gets()
    sp.puts("sgi,0x00,16")
    p sp.gets()
    sleep 0.5
    sp.puts("sgb,24,0xabcd,50,20")
    p sp.gets()
    p sp.gets()
    sleep 0.5
    sp.puts("rfw,0,0x0b,0x09")
    p sp.gets()
    sleep 0.5
    print("Check the center frequency:")
    gets()
    sp.puts("rfr,0,0x09")
    p sp.gets()
    sleep 0.5
    sp.puts("rfw,0,0x09,0x01")
    p sp.gets()
    sleep 0.5
    print("Check the next frequency:")
    gets()
    sp.puts("rfw,0,0x76,0x03")
    p sp.gets()
    sleep 0.5
    print("Check the modulation:")
    gets()

sp.close
