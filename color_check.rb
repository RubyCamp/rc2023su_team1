# require_relative '..\tutorials\13_EV3を動かしてみよう\ruby-ev3\lib\ev3.rb'
require_relative '.\ruby-ev3\lib\ev3.rb'

PORT = "COM4"
LEFT_MOTOR = "C"
RIGHT_MOTOR = "B"
COLOR_SENSOR = "3"

brick = EV3::Brick.new(EV3::Connections::Bluetooth.new(PORT))
brick.connect

puts "Start"

puts "Connected"
motors = [LEFT_MOTOR, RIGHT_MOTOR]

color = brick.get_sensor(COLOR_SENSOR, 2)

cnt = 0


while true 
    color = brick.get_sensor(COLOR_SENSOR, 2)

    case color
    when 0 then puts "色がありません"
    when 1 then puts "黒色"
    when 2 then puts "青色"
    when 3 then puts "緑色"
    when 4 then puts "黄色"
    when 5 then puts "赤色"
    when 6 then puts "白色"
    when 7 then puts "茶色"
    end
    sleep 1
    cnt += 1
end




