class Player < Character
  def update(map)
    # update_new_position(map, @x + rand(3) - 1, @y + rand(3) - 1)

    #以下追加コード
    px = 1
    py = 1

    # distance = @brick.get_sensor(DISTANCE_SENSOR, 0)
    color = @ev3_controller.get_color

    case color
      when 0.0 then # とりあえず止まってもらう
        puts "色がありません"
        @ev3_controller.stop(1.0)
      when 1.0 then # 少し右に曲がる
        puts "黒色"
        @ev3_controller.move_zigzag(0.15)
      when 2.0 then # 止まってちょっと下がる？
        puts "青色" 
        @ev3_controller.move_backward(0.1)
      when 5.0 then # ゴールなのでストップ
        puts "赤色"
        @ev3_controller.stop(0.2)
      when 6.0 then # 前に進む
        puts "白色"
        @ev3_controller.move_forward(0.1)
    end
    # ここまで

    update_new_position(map, @x + px, @y + py)

    #ここまで
  end
end