class EV3Controller
  COLOR_SENSOR = "3"
  LEFT_MOTOR = "C"
  RIGHT_MOTOR = "B"
  MOTOR_SPEED = 50

  def initialize(port = "COM4")
    @motors = [LEFT_MOTOR, RIGHT_MOTOR]
    @brick = EV3::Brick.new(EV3::Connections::Bluetooth.new(port))
    @brick.connect
    @brick.reset(*@motors)
    @wait_cnt = 0
    @last_color = get_color
  end

  def move_forward(sec, speed = MOTOR_SPEED)
    @brick.start(speed, *@motors)
    sleep sec
    @brick.stop(true, *@motors)
  end

  # 以下追加コード 左,右,後進
  def move_lefturn(sec, speed = MOTOR_SPEED)
    @brick.start(speed, *@motors[0])
    sleep sec
    @brick.stop(true, *@motors[0])
  end

  def move_righturn(sec, speed = MOTOR_SPEED)
    @brick.start(speed, *@motors[1])
    sleep sec
    @brick.stop(true, *@motors[1])
  end

  # ちょっと怪しい
  def move_backward(sec, speed = MOTOR_SPEED)
    # モーター反転
    @brick.reverse_polarity(*@motors)
    @brick.start(speed, *@motors)
    sleep sec
    @brick.stop(true, *@motors)
    # モーター元に戻す
    @brick.run_forward(*@motors)
  end
  # ここまで

  def get_color
    @wait_cnt += 1
    return @last_color unless @wait_cnt % 30 == 0
    @last_color = @brick.get_sensor(COLOR_SENSOR, 2)
  end

  def close
    @brick.stop(true, *@motors)
    @brick.clear_all
    @brick.disconnect
  end
end
