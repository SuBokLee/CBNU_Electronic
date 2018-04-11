class HomeController < ApplicationController
  
    def keyboard_init
        @msg =
            {
              type: "buttons",
              buttons: ["충북대 지도", "선택 2", "선택 3"]
            }
        render json: @msg, status: :ok
    end
    
    
    
    def chat_control
        received_data = JSON.parse(request.raw_post)
        user_key = received_data["user_key"]
        type_name = received_data["type"]
        content = received_data["content"]
        
        puts(user_key, type_name, content)
        
        
        if content == "충북대 지도"
            @msg = {
              message: {
                  text: "충북대 지도"
              },
              keyboard: {
                type: "buttons",
                # buttons: ["충북대 지도", "선택 2", "선택 3"]
                buttons: ["n 구역", "선택 2", "선택 3"]
              }
            }
            render json: @msg, status: :ok
        elsif content == "선택 2"
            @msg = {
              message: {
                  text: "선택 2를 누르셨습니다."
              },
              keyboard: {
                type: "buttons",
                buttons: ["선택 1", "선택 2", "선택 3"]
              }
            }
            render json: @msg, status: :ok
        elsif @response == "선택 3"
            @msg = {
              message: {
                  text: "선택 3을 누르셨습니다."
              },
              keyboard: {
                type: "buttons",
                buttons: ["선택 1", "선택 2", "선택 3"]
              }
            }
            render json: @msg, status: :ok
        else
            @msg = {
              message: {
                  text: "잘못된 명령어를 입력하셨습니다."
              },
              keyboard: {
                type: "buttons",
                buttons: ["선택 1", "선택 2", "선택 3"]
              }
            }
            render json: @msg, status: :ok
        end
    end
end
