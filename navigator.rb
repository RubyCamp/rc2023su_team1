class Navigator < Character
  def update(map)
    dx = 0
    dy = 0
    
    # 改造部分
    if Input.key_push?(K_RIGHT)
      dx = 1
      @ev3_controller.move_righturn(0.2)
    end

    if Input.key_push?(K_LEFT)
      dx = -1 
      @ev3_controller.move_lefturn(0.2)
    end

    if Input.key_push?(K_UP)
      dy = -1
      @ev3_controller.move_backward(0.2)
    end

    # ここまで

    if Input.key_push?(K_DOWN)
      dy = 1
      @ev3_controller.move_forward(0.2)
    end

    update_new_position(map, @x + dx, @y + dy)

    Window.draw_font(600, 100, "COLOR: #{@ev3_controller.get_color}", @font)
  end
end