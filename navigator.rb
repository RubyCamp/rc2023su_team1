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
  
      if Input.key_push?(K_DOWN)
        dy = 1
        @ev3_controller.move_forward(0.2)
      end
  
      # ここまで
  
      if Input.key_push?(K_DOWN)
        dy = 1
        @ev3_controller.move_forward(0.2)
      end
  
      update_new_position(map, @x + dx, @y + dy)
  
      Window.draw_font(600, 100, "COLOR: #{@ev3_controller.get_color}", @font)
      
     # 追加する部分（色の判定）

     def updata_cell(x,y,num)
        @map_data[y][x] = num
     end

      color = brick.get_sensor(COLOR_SENSOR, 2)

      case color
      when 0 then puts "色がありません"
      when 1 then puts "黒色"
      when 2 then map.updata_cell(@x, @y, 2)
      when 3 then map.updata_cell(@x, @y, 3)
      when 4 then puts "黄色"
      when 5 then map.updata_cell(@x, @y, 5)
      when 6 then map.updata_cell(@x, @y, 6)
      when 7 then puts "茶色"
      end
    
    end
  end