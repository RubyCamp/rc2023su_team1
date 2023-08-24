require 'ev3dev'

# タッチセンサーのポートを指定
TOUCH_SENSOR_PORT = EV3::Port::S1

# タッチセンサーのインスタンスを作成
touch_sensor = EV3::Sensor.new(TOUCH_SENSOR_PORT, EV3::Sensor::TOUCH)

# タッチセンサーの状態を読み取る
is_touched = touch_sensor.touched?

puts is_touched
