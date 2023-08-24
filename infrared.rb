require 'ev3dev'

class Robot
  LEFT_MOTOR = "C"
  RIGHT_MOTOR = "B"
  MOTOR_SPEED = 50

  def initialize
    @brick = EV3::Brick.new(EV3::Connections::Bluetooth.new("COM4"))
    @brick.connect
    @left_motor = EV3::Motor.new(LEFT_MOTOR)
    @right_motor = EV3::Motor.new(RIGHT_MOTOR)
    @ir_sensor = EV3::Sensor.new(EV3::Port::S1, EV3::Sensor::IR_PROX)

    @left_motor.reset
    @right_motor.reset
  end

  def move_forward
    @left_motor.start(MOTOR_SPEED)
    @right_motor.start(MOTOR_SPEED)
  end

  def stop
    @left_motor.stop
    @right_motor.stop
  end

  def close
    @left_motor.stop
    @right_motor.stop
    @brick.clear_all
    @brick.disconnect
  end

  def object_nearby?
    distance = @ir_sensor.distance
    distance < 5  # 距離が5センチ未満ならtrueを返す
  end
end

robot = Robot.new

begin
  robot.move_forward
  while !robot.object_nearby?
    # 物体が検出されるまで移動
  end
  robot.stop
  puts "Object is nearby: #{robot.object_nearby?}"
ensure
  robot.close
end

